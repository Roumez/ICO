// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// library usage
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Address.sol";
import "./Jaloine.sol";

contract FirstIco {
 
    // state variables
    using Adress for address payable;

    Jaloine private _token;
    address private _owner;
    uint256 private _priceToken;

    // events
    event JaloineTokenBought(address indexed buyer, uint256 amount);
    event Withrawed(address indexed sender, uint256 amount);

    // constructor
    constructor(address jaloineTokenAddress, address owner_, uint256 ratePrice_) Ownable() {
        _token = Jaloine(jaloineTokenAddress);
        _supplyInSale = _token.totalSupply();
        transferOwnership(owner_);
        _currentTime = block.timestamp;
        _ratePrice = ratePrice_; 
    }

    // modifiers
    modifier onlyOwner() {
        require(msg.sender == _owner, "FirstIco: Only owner can call this function");
        _;
    }
    modifier icoStart() {
        require(block.timestamp < (_currentTime + 2 weeks), "FirstIco: ICO is finish");
        _;
    }
     modifier icoFinish() {
        require(block.timestamp > (_currentTime + 2 weeks), "FirstIco: ICO is not finish");
        _;
    }

    // functions
    receive() external payable {
        _buy(msg.sender, msg.value);
    }

    function buy() public payable {
        _buy(msg.sender, msg.value);
    }

    function _buy(address sender, uint256 amount) private icoStart {
        uint256 amount = value / _ratePrice;
        require(_supplyInSale != 0, "ICO: there is no more token available");
        _tokenBalances[msg.sender] += amount;
    }

    function withdraw() onlyOwner icoFinish {
        uint256 profit = address(this).balance;
        require(profit != 0, "FirstIco: you can not withdraw empty balance");
        payable(msg.sender).sendValue(address(this).balance);
        emit Withrawed(msg.sender, profit);
    }

    function owner() public view returns(address) {
        return _owner;
    }
    
}
