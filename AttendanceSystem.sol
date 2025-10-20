// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract AttendanceSystem {
    address public teacher;

    mapping(address => bool) public isRegistered;
    mapping(address => uint) public totalDaysPresent;

    modifier OnlyTeacher() {
        require(msg.sender == teacher, "You aren't Teacher!");
        _;
    }

    event TrackAttendance(address indexed student, uint presentDays);

    constructor() {
        teacher = msg.sender;
    }

    function registerStudent(address student) public OnlyTeacher {
        require (!isRegistered[student], "Student already Registered!");
        isRegistered[student] = true;
    }

    function markAttendance(address student) public OnlyTeacher {
        require(isRegistered[student], "Student Not Registered!");
        totalDaysPresent[student] += 1;

        emit TrackAttendance(student, totalDaysPresent[student]);
    }

    function getAttendance(address student) public view returns (uint) {
        return totalDaysPresent[student];
    }
}
