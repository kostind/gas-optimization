// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract StorageReferenceInsteadOfMemory {
    uint256 constant DEFAULT_LIQUIDITY_INDEX = 10 ** 18;

    struct TokenConfig {
        bool supported;
        address token;
        uint256 liquidityIndex;
    }

    TokenConfig public tokenConfig;

    constructor() {
        address token = address(bytes20(uint160(1000)));
        tokenConfig = TokenConfig({supported: true, token: token, liquidityIndex: DEFAULT_LIQUIDITY_INDEX});
    }

    function processExpensive() external {
        TokenConfig memory _tokenConfig = tokenConfig;
        tokenConfig.liquidityIndex = _updateLiquidityIndex(_tokenConfig.liquidityIndex);
    }

    function processOptimized() external {
        TokenConfig storage _tokenConfig = tokenConfig;
        tokenConfig.liquidityIndex = _updateLiquidityIndex(_tokenConfig.liquidityIndex);
    }

    function _updateLiquidityIndex(uint256 liquidityIndex) private returns (uint256) {
        return liquidityIndex * 11 * 10 ** 17 / DEFAULT_LIQUIDITY_INDEX;
    }
}
