// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test} from "forge-std/Test.sol";
import {CachingStorageReads} from "../src/CachingStorageReads.sol";

contract CachingStorageReadsTest is Test {
    CachingStorageReads public cachingStorageReads;

    function setUp() public {
        cachingStorageReads = new CachingStorageReads();
    }

    function test_processExpensive() public {
        cachingStorageReads.processExpensive();
    }

    function test_processOptimized() public {
        cachingStorageReads.processOptimized();
    }
}
