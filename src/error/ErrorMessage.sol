// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract ErrorMessage {
    bool private initialized;

    error ShortErrorSmallerThan32Bytes();
    error LongErrorThatIsReallyBiggerThan32Bytes();

    function shortErrorExpensive() external {
        require(initialized, "ShortErrorSmallerThan32Bytes");
    }

    function shortErrorOptimized() external {
        require(initialized, ShortErrorSmallerThan32Bytes());
    }

    function longErrorExpensive() external {
        require(initialized, "LongErrorThatIsReallyBiggerThan32Bytes");
    }

    function longErrorOptimized() external {
        require(initialized, LongErrorThatIsReallyBiggerThan32Bytes());
    }
}
