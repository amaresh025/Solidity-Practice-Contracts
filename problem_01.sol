// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MyFirstContract{
    string public myName;

    function setName(string memory _name) public {
        myName = _name;
    }
    function getName() public view returns (string memory) {
        return myName;
    } 
}