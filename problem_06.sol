// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract SimpleSecond{
    string public myText;

    function update(string memory _newText) public {
        myText = _newText;
    }
}