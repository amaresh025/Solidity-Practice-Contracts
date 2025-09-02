// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BookStore{
    struct Book{
        string title;
        uint256 id;
    }
    Book[] public Library;
    function addBook(string memory _title, uint256 _id) public {
        Library.push(Book(_title, _id));
    }
}