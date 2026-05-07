// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test} from "forge-std/Test.sol";
import {ConstantInsteadOfStorageVariable} from "src/storage/ConstantInsteadOfStorageVariable.sol";

contract CachingStorageReadsTest is Test {
    ConstantInsteadOfStorageVariable public contractInstance;

    function setUp() public {
        contractInstance = new ConstantInsteadOfStorageVariable();
    }

    function test_processExpensive() public {
        contractInstance.processExpensive(13);
    }

    function test_processOptimized() public {
        contractInstance.processOptimized(13);
    }
}
