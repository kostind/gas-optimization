// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test} from "forge-std/Test.sol";
import {CacheStorageReads} from "../src/CacheStorageReads.sol";

contract CachingStorageReadsTest is Test {
    CacheStorageReads public cachingStorageReads;

    function setUp() public {
        cachingStorageReads = new CacheStorageReads();
    }

    function test_processExpensive() public {
        cachingStorageReads.processExpensive();
    }

    function test_processOptimized() public {
        cachingStorageReads.processOptimized();
    }
}
