// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract ToggleContract{

    bool public isOn;

    function toggle() public {
        isOn = !isOn;
    }
}