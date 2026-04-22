// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test} from "forge-std/Test.sol";
import {CacheArrayLength} from "src/storage/CacheArrayLength.sol";

contract CachingStorageReadsTest is Test {
    CacheArrayLength public contractInstance;

    function setUp() public {
        contractInstance = new CacheArrayLength();
    }

    function test_processExpensive() public {
        contractInstance.processExpensive();
    }

    function test_processOptimized() public {
        contractInstance.processOptimized();
    }
}
