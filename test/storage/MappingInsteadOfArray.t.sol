// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test} from "forge-std/Test.sol";
import "../../src/storage/MappingInsteadOfArray.sol";

contract MappingInsteadOfArrayTest is Test {
    MappingInsteadOfArray public contractInstance;

    function setUp() public {
        contractInstance = new MappingInsteadOfArray();
    }

    function test_loopExpensive() public {
        contractInstance.loopExpensive();
    }

    function test_loopOptimized() public {
        contractInstance.loopOptimized();
    }
}
