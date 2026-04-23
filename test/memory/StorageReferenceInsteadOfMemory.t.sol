// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test} from "forge-std/Test.sol";
import "../../src/memory/StorageReferenceInsteadOfMemory.sol";

contract StorageReferenceInsteadOfMemoryTest is Test {
    StorageReferenceInsteadOfMemory public contractInstance;

    function setUp() public {
        contractInstance = new StorageReferenceInsteadOfMemory();
    }

    function test_processExpensive() public {
        contractInstance.processExpensive();
    }

    function test_processOptimized() public {
        contractInstance.processOptimized();
    }
}
