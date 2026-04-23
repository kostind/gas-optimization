// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test} from "forge-std/Test.sol";
import "../../src/error/ErrorMessage.sol";

contract ErrorMessageTest is Test {
    ErrorMessage public contractInstance;

    function setUp() public {
        contractInstance = new ErrorMessage();
    }

    function test_shortErrorExpensive() public {
        vm.expectRevert();
        contractInstance.shortErrorExpensive();
    }

    function test_shortErrorOptimized() public {
        vm.expectRevert();
        contractInstance.shortErrorOptimized();
    }

    function test_longErrorExpensive() public {
        vm.expectRevert();
        contractInstance.longErrorExpensive();
    }

    function test_longErrorOptimized() public {
        vm.expectRevert();
        contractInstance.longErrorOptimized();
    }
}
