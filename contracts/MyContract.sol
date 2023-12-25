// SPDX-License-Identifier: MIT

pragma solidity ^0.8.2;

contract MyContract {

//State Variables
int256 public  myInt = -100;
uint public number = 100;
uint256 public num = 100;
uint8 public SmallInt = 1;

string public myStr = "My cat looks like a Dog!";
bytes32 public myBytes32 = "Some special string I suppose";


//Adress is for contracts ,users ,wallets
address public myAddress = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;

struct Mystruct {
    uint myuint;
    string myString;
}
Mystruct public mystruct = Mystruct (1,"hellow there");

function getValue() public pure returns(uint){
    uint value = 1;
    return value;
}

}