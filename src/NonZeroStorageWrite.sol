// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract NonZeroStorageWrite {
    uint256 private constant NOT_ENTERED_EXPENSIVE = 0;
    uint256 private constant ENTERED_EXPENSIVE = 1;

    uint256 private constant NOT_ENTERED_OPTIMIZED = 2;
    uint256 private constant ENTERED_OPTIMIZED = 3;

    uint256 internal state;
    bool internal invoked;

    error ReentrantCall();

    modifier nonReentrantExpensive() {
        require(state != ENTERED_EXPENSIVE, ReentrantCall());
        state = ENTERED_EXPENSIVE;
        _;
        state = NOT_ENTERED_EXPENSIVE;
    }

    modifier nonReentrantOptimized() {
        require(state != ENTERED_OPTIMIZED, ReentrantCall());
        state = ENTERED_OPTIMIZED;
        _;
        state = NOT_ENTERED_OPTIMIZED;
    }

    function processExpensive() external nonReentrantExpensive {
        invoked = true;
    }

    function processOptimized() external nonReentrantOptimized {
        invoked = true;
    }
}
