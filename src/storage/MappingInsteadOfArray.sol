// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract MappingInsteadOfArray {
    uint256 constant DEFAULT_LIQUIDITY_INDEX = 10 ** 18;

    struct TokenConfig {
        bool supported;
        address token;
        uint256 liquidityIndex;
    }

    mapping(uint256 => TokenConfig) tokenConfigMapping;
    uint256 tokenCount;

    TokenConfig[] tokenConfigArray;

    constructor() {
        for (uint256 i = 0; i < 10; i++) {
            address token = address(bytes20(uint160((i + 1) * 1000)));
            TokenConfig memory tokenConfig =
                TokenConfig({supported: true, token: token, liquidityIndex: DEFAULT_LIQUIDITY_INDEX});

            tokenConfigMapping[i] = tokenConfig;
            tokenCount++;

            tokenConfigArray.push(tokenConfig);
        }
    }

    function loopExpensive() external {
        uint256 length = tokenConfigArray.length;
        for (uint256 i = 0; i < length; i++) {
            _updateLiquidityIndexUsingArray(i);
        }
    }

    function loopOptimized() external {
        uint256 length = tokenCount;
        for (uint256 i = 0; i < length; i++) {
            _updateLiquidityIndexUsingMapping(i);
        }
    }

    function _updateLiquidityIndexUsingArray(uint256 tokenIndex) private {
        tokenConfigArray[tokenIndex].liquidityIndex = _updateLiquidityIndex(tokenConfigArray[tokenIndex].liquidityIndex);
    }

    function _updateLiquidityIndexUsingMapping(uint256 tokenIndex) private {
        tokenConfigMapping[tokenIndex].liquidityIndex =
            _updateLiquidityIndex(tokenConfigMapping[tokenIndex].liquidityIndex);
    }

    function _updateLiquidityIndex(uint256 liquidityIndex) private returns (uint256) {
        return liquidityIndex * 11 * 10 ** 17 / DEFAULT_LIQUIDITY_INDEX;
    }
}
