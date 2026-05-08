// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract Assembly4ExternalCall {

    address public factory;

    constructor(address _factory) {
        factory = _factory;
    }

    function processExpensive() external {
        Factory(factory).setData(123);
    }

    function processOptimized() external {
        Factory(factory).setData(123);
    }
}

contract Factory {
    uint256 public data;

    function setData(uint256 _data) external {
        data = _data;
    }
}
