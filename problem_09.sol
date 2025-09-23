// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract FifthContract{
    //state variable
    uint num;
    //this function set the number you gave
    function setNum(uint _num) public {
        num = _num;
    }
    // this function return the number you set before
    function getNum() public view returns (uint){
        return num;
    }


}
