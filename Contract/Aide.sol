
//SPDX-License-Identifier: MIT

pragma solidity ^0.8.4;

contract Aide {

    mapping(address => uint) private _balanceReceived;

    function receiveMoney() public payable {
        assert (_balanceReceived[msg.sender] + msg.value >= _balanceReceived[msg.sender]);
        _balanceReceived[msg.sender] += msg.value;
    }
    function withdrawMoney(address payable _to, uint _amount) public {
        require(_amount <= _balanceReceived[msg.sender], "Aide: You do not have enough funds");
        assert(_balanceReceived[msg.sender] >= _balanceReceived[msg.sender] - _amount);
        _balanceReceived[msg.sender] -= _amount;
        _to.transfer(_amount);
    }
    receive() external payable {
        receiveMoney();
    }
}
