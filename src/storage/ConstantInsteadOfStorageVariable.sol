// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract ConstantInsteadOfStorageVariable {
    uint256 public constant ONE = 10 ** 18;
    uint256 public oneVar = 10 ** 18;

    function processExpensive(uint256 x) external view returns (uint256) {
        return x * oneVar;
    }

    function processOptimized(uint256 x) external pure returns (uint256) {
        return x * ONE;
    }
}
