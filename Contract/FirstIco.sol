// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

// library usage

import "@OpenZeppelin/contracts/token/ERC20/IERC20.sol";

contract FirstIco is IERC20 {
 
    // state variables
    address private _owner;
    uint256 private _priceToken;

    // events

    // constructor
    constructor(address owner_, uint256 initialSupply, uint256 priceToken_) IERC20(){
        
    }

    // modifiers
    modifier onlyOwner() {
        require(msg.sender == _owner, "FirstIco: Only owner can call this function");
        _;
    }

    // functions
    function owner() public view returns(address) {
        return _owner;
    }
    
}
