//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.4;

import "OpenZeppelin/openzeppelin-contracts@4.5.0/contracts/interfaces/IERC20.sol";
import "../interfaces/yInterfaces.sol";
import "OpenZeppelin/openzeppelin-contracts@4.5.0/contracts/access/Ownable.sol";
import "OpenZeppelin/openzeppelin-contracts@4.5.0/contracts/security/ReentrancyGuard.sol";
import "OpenZeppelin/openzeppelin-contracts@4.5.0/contracts/token/ERC721/ERC721.sol";

contract NotGonnaMakeIt is Ownable, ReentrancyGuard, ERC721("NGMI FUDN", "NGMI") {
    
    IV2Registry yRegistry;
    IVault yVault;
    IERC20 yToken;

    mapping(address => uint256) public lastPulse;

    /// @notice stores if and only if address is in lastWill.beneficiaries 
    /// @dev  storage order [ msg.sender ] [ issuer ] 
    /// @return bool
    mapping(address => mapping(address => bool)) public isBeneficiaryOf;
    
    mapping (address => Will) public getWillByIssuer;

    /// @notice 
    struct Will {
        address issuer;
        address erc20;
        address[] beneficiaries;
        uint256[] piePieces; // must total 100
        uint256 takePulseInterval;
    }

    constructor(address yearnRegistry) {
        yRegistry = IV2Registry(yearnRegistry);
    }

    /// events

    event WillCreated(address indexed _issuer, uint256 _takePulseI );
    event WillDestroyed(address indexed _issuer);
    event WllUpdated(address indexed _issuer);

    /// function withdraw

    /// function deposit

    /// function destroy

    /// function create / update

    function setWill(address _token, address[] memory _beneficiaries, uint256[] memory _piePieces) external returns (bool) {
        require(_token != address(0));
        require(_beneficiaries.length == _piePieces.length);
    }

    /// function flag






    ////View

    function viewWill(address _issuer) public view returns ( Will memory w) {
        w= getWillByIssuer[_issuer];
    }










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
