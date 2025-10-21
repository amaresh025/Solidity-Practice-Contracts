// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BankSmartContract {
    mapping(address => uint) public balances; //mapping for check balance

    //some event for tracking history
    event TrackDeposit(address indexed sender, uint amount);
    event TrackWithdraw(address indexed receiver, uint amount);
    event TrackTransfer(address indexed from, address indexed to, uint amount);

    modifier CheckBalance(uint amount) {
        require(balances[msg.sender] >= amount, "Insufficient Balance!");
        _;
    }

    //deposit fund
    function deposit() public payable {
        balances[msg.sender] += msg.value;
        emit TrackDeposit(msg.sender, msg.value);
    }

    //withdraw balance into your wallet
    function withdraw(uint amount) public CheckBalance(amount) {
        balances[msg.sender] -= amount;
        payable(msg.sender).transfer(amount);
        emit TrackWithdraw(msg.sender, amount);
    }

    //transfer blances user to user
    function transfer(address user, uint amount) public CheckBalance(amount) {
        balances[msg.sender] -= amount;
        balances[user] += amount;
        emit TrackTransfer(msg.sender, user, amount);
    }

    //checks the balance of this contract
    function getContractBalance() public view returns (uint) {
        return address(this).balance;
    }
}
