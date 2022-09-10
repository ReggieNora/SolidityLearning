// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3; 

//State Variable of "Owner"
address public owner; 

//This establishes the Owner as msg.sender
constructor() public { 
    owner = msg.sender; 
}

//This modifier checks to see if the Owner is equal to the Owner in msg.sender. If not, error is thrown. 
modifier onlyOwner() {
    require(msg.sender == owner, "Not Owner");
    _;
}

//This checks to see if the address is valid before assigning the newOwner to Owner
modifier validAddress(address _addr) {
    require (_addr != address(0), "Not a valid address!");
    _;
}

//This function uses modifiers to compare owners and validates the address before converting to newOwner
function changeOwner(address _newOwner) public onlyOwner validAddress(_newOwner) {
    owner = _newOwner;
}

