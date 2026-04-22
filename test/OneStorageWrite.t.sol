// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test} from "forge-std/Test.sol";
import {OneStorageWrite} from "../src/OneStorageWrite.sol";

contract OneStorageWriteTest is Test {
    OneStorageWrite public contractInstance;

    function setUp() public {
        contractInstance = new OneStorageWrite();
    }

    function test_processExpensive() public {
        contractInstance.processExpensive();
    }

    function test_processOptimized() public {
        contractInstance.processOptimized();
    }
}
