// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract School{
    struct Student{
        string name;
        uint256 rollNumber;
    }
    mapping (uint256 => Student) public students;

    function addStudent(string memory _name, uint256 _rollNumber) public {
        students[_rollNumber] = Student(_name, _rollNumber);
    }
    function getStudent(uint256 _rollNumber) public view returns (Student memory) {
        return students[_rollNumber];


    } 
}