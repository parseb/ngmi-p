// SPDX-License-Identifier: BUSL-1.1

pragma solidity ^0.8.4;

import "OpenZeppelin/openzeppelin-contracts@4.5.0/contracts/interfaces/IERC20.sol";

interface IAPWToken is IERC20 {
    /**
     * @notice Mint tokens to the specified wallet
     * @param _to the address of the receiver
     * @param _amount the amount of token to mint
     * @dev caller must be granted to MINTER_ROLE
     */
    function mint(address _to, uint256 _amount) external;
}
