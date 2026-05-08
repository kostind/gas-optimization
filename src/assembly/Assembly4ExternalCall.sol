// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract Assembly4ExternalCall {
    address public factory;

    constructor(address _factory) {
        factory = _factory;
    }

    function processExpensive() external {
        uint256 x = 123;
        Factory(factory).setData(x);
    }

    function processOptimized() external {
        uint256 x = 123;
        address _factory = factory;
        assembly {
            mstore(0x00, hex"5b4b73a9") //setData(uint256)
            mstore(0x04, x)

            if iszero(extcodesize(_factory)) {
                revert(0x00, 0x00)
            }

            let success := call(gas(), _factory, 0x00, 0x00, 0x24, 0x00, 0x00)

            if iszero(success) {
                revert(0x00, 0x00)
            }
        }
    }
}

contract Factory {
    uint256 public data;

    function setData(uint256 _data) external {
        data = _data;
    }
}
