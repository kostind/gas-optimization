// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import { console } from "forge-std/console.sol";
import "./Assembly4ExternalCall.sol";

contract Assembly4ExternalCall {
    address public factory;

    constructor(address _factory) {
        factory = _factory;
    }

    function processExpensive() external {
        Factory.PriceData memory data = Factory.PriceData({
            price: 13 * 10**18,
            operatorId: 12345
        });

        Factory(factory).setData(data);
    }

    function processOptimized() external {
        Factory.PriceData memory data = Factory.PriceData({
            price: 13 * 10**18,
            operatorId: 12345
        });
        address _factory = factory;

        bytes32 pointer;
        assembly {
            pointer := sub(mload(0x40), 0x40)

            mcopy(add(pointer, 0x20), pointer, 0x40)
            mstore(pointer, 0xc4bfa221) //setData((uint256,uint256))

            if iszero(extcodesize(_factory)) {
                revert(0x00, 0x00)
            }

            let success := call(gas(), _factory, 0x00, add(pointer, 28), 0x44, 0x00, 0x00)

            if iszero(success) {
                revert(0x00, 0x00)
            }
        }
    }
}

contract Factory {
    PriceData public data;

    struct PriceData {
        uint256 price;
        uint256 operatorId;
    }

    function setData(PriceData memory _data) external {
        console.logBytes4(msg.sig);

        data = _data;

        console.log(data.price);
        console.log(data.operatorId);
    }
}
