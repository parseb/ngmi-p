//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.4;

import "OpenZeppelin/openzeppelin-contracts@4.5.0/contracts/interfaces/IERC20.sol";
import "../interfaces/yInterfaces.sol";
import "OpenZeppelin/openzeppelin-contracts@4.5.0/contracts/access/Ownable.sol";
import "OpenZeppelin/openzeppelin-contracts@4.5.0/contracts/security/ReentrancyGuard.sol";
import "OpenZeppelin/openzeppelin-contracts@4.5.0/contracts/token/ERC721/ERC721.sol";

contract NotGonnaMakeIt is Ownable, ReentrancyGuard, ERC721("NGMI FUDN", "NGMI") {
    
    IV2Registry yRegistry;
    // IVault yVault;
    // IERC20 yToken;

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
        uint256[] piePieces;
        uint256 takePulseInterval;
        uint256 baseValue;
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

    /// @dev thesis: yield same for all since continously harvested. early dissadvantage?
    function setWill(address _token, address[] memory _beneficiaries, uint256[] memory _piePieces, uint256 _tokenAmount, uint256 _pulseInterval) external nonReentrant returns (bool) {
        require(_beneficiaries.length == _piePieces.length && ( _beneficiaries.length + _piePieces.length > 1) );
        require(_tokenAmount > 0);
        address v = tokenHasVault(_token);
        require(v != address(0));
        if(IERC20(_token).allowance(address(this),v) < _tokenAmount) IERC20(_token).approve(v, type(uint256).max-1 );

        getWillByIssuer[msg.sender].issuer = msg.sender;
        getWillByIssuer[msg.sender].erc20 = _token;
        getWillByIssuer[msg.sender].beneficiaries = _beneficiaries;
        getWillByIssuer[msg.sender].piePieces = _piePieces;
        getWillByIssuer[msg.sender].takePulseInterval = _pulseInterval;


        require(IERC20(_token).transferFrom(msg.sender, address(this), _tokenAmount)
, "transfer failed");
        uint256 contractBalance = IERC20(v).balanceOf(address(this));
        require( IVault(v).deposit(_tokenAmount) > 1, "vault deposit failed");
        getWillByIssuer[msg.sender].baseValue += IERC20(v).balanceOf(address(this)) - contractBalance; //
                
        lastPulse[msg.sender] = block.timestamp;

        emit WillCreated(msg.sender, _pulseInterval);
    }


    /// function flag






    ////View

    function viewWill(address _issuer) public view returns ( Will memory w) {
        w= getWillByIssuer[_issuer];
    }










/// VIEW
    function tokenHasVault(address _t)
        private
        view
        returns (address vault)
    {
        try yRegistry.latestVault(_t) returns (address response) {
            if (response != address(0)) {
                vault = response;
            }
        } catch {
            vault = address(0);
        }
    }
}
