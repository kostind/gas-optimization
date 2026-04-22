// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test} from "forge-std/Test.sol";
import "src/storage/NonZero2NonZeroStorageWrite.sol";

contract NonZeroStorageWriteTest is Test {
    Zero2NonZeroStorageWrite public zero2NonZeroInstance;
    NonZero2NonZeroStorageWrite public nonZero2NonZeroInstance;

    function setUp() public {
        zero2NonZeroInstance = new Zero2NonZeroStorageWrite();
        nonZero2NonZeroInstance = new NonZero2NonZeroStorageWrite();
    }

    function test_processExpensive() public {
        zero2NonZeroInstance.processExpensive();
    }

    function test_processOptimized() public {
        nonZero2NonZeroInstance.processOptimized();
    }
}
