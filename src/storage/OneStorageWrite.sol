// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract OneStorageWrite {
    uint256 public number;

    function processExpensive() external {
        for (uint256 i = 1; i <= 10; i++) {
            number += i;
        }
    }

    function processOptimized() external {
        uint256 numberCache = number;
        for (uint256 i = 1; i <= 10; i++) {
            numberCache += i;
        }
        number = numberCache;
    }
}
