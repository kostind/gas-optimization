// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test} from "forge-std/Test.sol";
import {Assembly4ExternalCall, Factory} from "src/assembly/Assembly4ExternalCall.sol";

contract Assembly4ExternalCallTest is Test {
    Assembly4ExternalCall public contractInstance;

    function setUp() public {
        Factory factory = new Factory();
        contractInstance = new Assembly4ExternalCall(address(factory));
    }

    function test_processExpensive() public {
        contractInstance.processExpensive();
    }

    function test_processOptimized() public {
        contractInstance.processOptimized();
    }
}
