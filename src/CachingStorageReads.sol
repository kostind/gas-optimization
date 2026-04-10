// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract CachingStorageReads {

    uint public number = 1;

    function processOptimized() external {
        uint numberCache = number;

        for (uint i = 0; i < 100; i++) {
            numberCache += i;
        }

        number = numberCache;
    }

    function processExpensive() external {
        for (uint i = 0; i < 100; i++) {
            number += i; // 100 storage reads and writes
        }
    }

}
