// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test} from "forge-std/Test.sol";
import {OneStorageWrite} from "../src/OneStorageWrite.sol";

contract OneStorageWriteTest is Test {
    OneStorageWrite public oneStorageWrite;

    function setUp() public {
        oneStorageWrite = new OneStorageWrite();
    }

    function test_processExpensive() public {
        oneStorageWrite.processExpensive();
    }

    function test_processOptimized() public {
        oneStorageWrite.processOptimized();
    }
}
