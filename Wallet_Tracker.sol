// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract WalletTracker {
    mapping(address => uint) public balance;

    event TrackTransaction(address indexed _user, address _owner, uint _value);

    modifier Require(uint amount) {
        require(balance[msg.sender] >= amount, "Insufficient balance");
        _;
    }

    function deposit() public payable {
        balance[msg.sender] += msg.value;
    }

    function withdraw(uint amount) public Require(amount) {
        balance[msg.sender] -= amount;

        payable(msg.sender).transfer(amount);
    }

    function transfer(address user, uint amount) public Require(amount) {
        balance[msg.sender] -= amount;

        balance[user] += amount;
        emit TrackTransaction(user, msg.sender, amount);
    }

    function getBalance() public view returns (uint) {
        return address(this).balance;
    }
}
