// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test} from "forge-std/Test.sol";
import {CacheArrayLength} from "../src/CacheArrayLength.sol";

contract CachingStorageReadsTest is Test {
    CacheArrayLength public cacheArrayLength;

    function setUp() public {
        cacheArrayLength = new CacheArrayLength();
    }

    function test_processExpensive() public {
        cacheArrayLength.processExpensive();
    }

    function test_processOptimized() public {
        cacheArrayLength.processOptimized();
    }
}
