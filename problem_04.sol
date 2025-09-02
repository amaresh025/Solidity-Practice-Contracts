// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract School{

     struct Student{
        string name;
        uint256 rollNumber;
        uint256 marks;
    }
    Student[] allStudents;
    
    function addStudent(string memory _name, uint256 _rollNumber, uint256 _marks) public {
        allStudents.push(Student(_name, _rollNumber, _marks));
    }

   function findTopper() public view returns (string memory, uint256) {
        uint256 highestMarks = 0;
        string memory topperName = "";

        for (uint i = 0; i < allStudents.length; i++) {
            if (allStudents[i].marks > highestMarks) {
            highestMarks = allStudents[i].marks;
            topperName = allStudents[i].name;
        }
    }

    return (topperName, highestMarks);
}


}