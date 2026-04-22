// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test} from "forge-std/Test.sol";
import "../src/NonZeroStorageWrite.sol";

contract NonZeroStorageWriteTest is Test {
    ZeroStorageWrite public zeroInstance;
    NonZeroStorageWrite public nonZeroInstance;

    function setUp() public {
        zeroInstance = new ZeroStorageWrite();
        nonZeroInstance = new NonZeroStorageWrite();
    }

    function test_processExpensive() public {
        zeroInstance.processExpensive();
    }

    function test_processOptimized() public {
        nonZeroInstance.processOptimized();
    }
}
