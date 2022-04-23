//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.4;

import "OpenZeppelin/openzeppelin-contracts@4.5.0/contracts/interfaces/IERC20.sol";
import "../interfaces/yInterfaces.sol";

contract NotGonnaMakeIt {
    
    IV2Registry yRegistry;
    IVault yVault;
    IERC20 yToken;
    mapping(address => uint256) lastPulse;

    /// @notice stores if and only if address is in lastWill.beneficiaries 
    /// @dev  storage order [ msg.sender ] [ issuer ] 
    /// @return bool
    mapping(address => mapping(address => bool)) public isBeneficiaryOf;
    

    /// @notice 
    struct Will {
        address issuer;
        address[] beneficiaries;
        uint256[] piePieces; // must total 100
        uint256 takePulseInterval;
    }

    
    constructor(address yearnRegistry) {
        yRegistry = IV2Registry(yearnRegistry);
    }



    /// function withdraw

    /// function deposit

    /// function destroy

    /// function create / update

    /// function flag



















/// VIEW
    function tokenHasVault(address _buybackERC)
        public
        view
        returns (address vault)
    {
        try yRegistry.latestVault(_buybackERC) returns (address response) {
            if (response != address(0)) {
                vault = response;
            }
        } catch {
            vault = address(0);
        }
    }
}
