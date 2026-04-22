// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test} from "forge-std/Test.sol";
import {NonZeroStorageWrite} from "../src/NonZeroStorageWrite.sol";

contract NonZeroStorageWriteTest is Test {
    NonZeroStorageWrite public contractInstance;

    function setUp() public {
        contractInstance = new NonZeroStorageWrite();
    }

    function test_processExpensive() public {
        contractInstance.processExpensive();
    }

    function test_processOptimized() public {
        contractInstance.processOptimized();
    }
}
