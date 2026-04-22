// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract CacheStorageReads {
    uint256 public number = 1;

    function processOptimized() external {
        uint256 numberCache = number;

        for (uint256 i = 0; i < 100; i++) {
            numberCache += i;
        }

        number = numberCache;
    }

    function processExpensive() external {
        for (uint256 i = 0; i < 100; i++) {
            number += i; // 100 storage reads and writes
        }
    }
}
