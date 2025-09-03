// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract SimpleFirst{
    uint256 myAge;

    function setAge(uint256 _myAge) public {
        myAge = _myAge;
        
    }function getAge() public view returns (uint256) {
        return  myAge;
    }
}