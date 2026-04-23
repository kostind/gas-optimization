// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract MappingInsteadOfArray {
    uint248 constant DEFAULT_LIQUIDITY_INDEX = 10 ** 18;

    struct TokenConfig {
        bool supported;
        uint248 liquidityIndex;
    }

    mapping(address => TokenConfig) tokenConfigMapping;
    address[] tokens;

    TokenConfig[] tokenConfigArray;

    constructor() {
        for (uint256 i = 0; i < 10; i++) {
            address token = address(bytes20(uint160(i + 1)));
            TokenConfig memory tokenConfig = TokenConfig({supported: true, liquidityIndex: DEFAULT_LIQUIDITY_INDEX});

            tokenConfigMapping[token] = tokenConfig;
            tokens.push(token);

            tokenConfigArray.push(tokenConfig);
        }
    }

    function loopExpensive() external {}

    function loopOptimized() external {}

    function _updateLiquidityIndex() private {}
}
