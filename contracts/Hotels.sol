//SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

contract Hotels {
    address payable public owner;
    enum Status {Vacant, Occupied}
    Status public currentStatus;
    uint public  lastOccupiedTime ;
    
    event Occoupy( address _occupant , uint _value);
    event Vacation();

    constructor (){
        owner = payable (msg.sender);
        currentStatus = Status.Vacant;
        lastOccupiedTime = 0;
    }
    modifier isVacant(){
        require(currentStatus == Status.Vacant, "Room Currently Booked.., Pls Try again Later");
        _;
    }
    modifier costs(uint _amount){
         require(msg.value >= _amount,"Insufficient Balance");
         _;
    }
    function  Book() public  payable  isVacant costs(0.5 ether) {
        currentStatus = Status.Occupied;
        lastOccupiedTime = block.timestamp;
        (bool sent, bytes memory data) = owner.call{value:msg.value}("");
        require(sent);
        emit Occoupy(msg.sender,msg.value);
    }
    function checkAndVacateRoom(uint _duration ) public {
        require(currentStatus == Status.Occupied, "Room is not currently occupied");
        require(block.timestamp >= lastOccupiedTime + _duration, "Time period not elapsed");
        //Usually 12 hour slots, 
        currentStatus = Status.Vacant;
        emit Vacation();
    }

}