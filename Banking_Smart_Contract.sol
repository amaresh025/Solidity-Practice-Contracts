// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BankSmartContract {
    // Mapping to store user balances
    mapping(address => uint) public balances;

    // Events for tracking history
    event TrackDeposit(address indexed sender, uint amount);
    event TrackWithdraw(address indexed receiver, uint amount);
    event TrackTransfer(address indexed from, address indexed to, uint amount);

    // Modifier to check sufficient balance
    modifier CheckBalance(uint amount) {
        require(balances[msg.sender] >= amount, "Insufficient Balance!");
        _;
    }

    // Deposit funds into the contract
    function deposit() public payable {
        balances[msg.sender] += msg.value;
        emit TrackDeposit(msg.sender, msg.value);
    }

    // Withdraw funds from the contract
    function withdraw(uint amount) public CheckBalance(amount) {
        balances[msg.sender] -= amount;
        payable(msg.sender).transfer(amount);
        emit TrackWithdraw(msg.sender, amount);
    }

    // Transfer balance from sender to another user
    function transfer(address user, uint amount) public CheckBalance(amount) {
        balances[msg.sender] -= amount;
        balances[user] += amount;
        emit TrackTransfer(msg.sender, user, amount);
    }

    // Get total ETH stored in this contract
    function getContractBalance() public view returns (uint) {
        return address(this).balance;
    }

    function getMyBalance() public view returns (uint) {
        return balances[msg.sender];
    }
}
