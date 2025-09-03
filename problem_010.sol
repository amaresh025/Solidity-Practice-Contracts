// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract SimpleSum{
    uint a;
    uint b;
    //this function take two numbers in input
    function enterSumValue(uint _a, uint _b) public {
       a = _a;
       b = _b;
    }
    // this function will return sum of input numbers
    function getSum() public view returns (uint){
        return a + b;
    }
    
}