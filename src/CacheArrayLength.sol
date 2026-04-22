// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract CacheArrayLength {
    uint256[] public numbers;

    constructor () {
        for (uint256 i = 0; i < 10; i++) {
            numbers.push(i * 1000);
        }
    }

    function processOptimized() external view returns (uint256) {
        uint256 sum;
        uint256 length = numbers.length;
        for (uint256 i = 0; i < length; i++) {
            sum += numbers[i];
        }
        return sum;
    }

    function processExpensive() external view returns (uint256) {
        uint256 sum;
        for (uint256 i = 0; i < numbers.length; i++) {
            sum += numbers[i];
        }
        return sum;
    }
}
