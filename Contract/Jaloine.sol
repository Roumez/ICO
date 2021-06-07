// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

// library usage
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract Jaloine is ERC20, ownable {
 
    // state variables
    address private _owner;
    // events

    // constructor
    constructor(address owner_, uint256 totalSupply_) ERC20("Jaloine","JLN") Ownable() {
        _mint(owner_, totalSupply_);
        transferOwnership(owner_);
    }


    // modifiers

    // functions
    /**
     * @dev Returns the address of the current owner.
     */
    function owner() public view virtual returns (address){
        return _owner;
    }
    
}
