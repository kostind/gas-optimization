// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract ErrorMessage {
    bool private initialized;

    error ShortErrorSmallerThan32Bytes();
    error LongErrorThatIsReallyBiggerThan32Bytes();

    function shortErrorExpensive() external view {
        require(initialized, "ShortErrorSmallerThan32Bytes");
    }

    function shortErrorOptimized() external view {
        require(initialized, ShortErrorSmallerThan32Bytes());
    }

    function longErrorExpensive() external view {
        require(initialized, "LongErrorThatIsReallyBiggerThan32Bytes");
    }

    function longErrorOptimized() external view {
        require(initialized, LongErrorThatIsReallyBiggerThan32Bytes());
    }
}
