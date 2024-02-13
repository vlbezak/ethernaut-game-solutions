// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "hardhat/console.sol";

contract TokenTransfer {
    Token token;

    constructor(address tokenAddress) public{
        token = Token(tokenAddress);
    }

    function callTokenTransfer(address _to, uint _value) public {
        require(token.transfer(_to, _value), "Transfer not successful");
    }
}

contract Token {

  mapping(address => uint) balances;
  uint public totalSupply;

  constructor(uint _initialSupply) public {
    balances[msg.sender] = totalSupply = _initialSupply;
  }

  function transfer(address _to, uint _value) public returns (bool) {
    require(balances[msg.sender] - _value >= 0);
    console.log("Balance of Sender  before :" , balances[msg.sender]);
    balances[msg.sender] -= _value;
    console.log("Balace of Sender   after  :", balances[msg.sender]);
    console.log("Balance of Recp    before :", balances[_to]);
    balances[_to] += _value;
    console.log("Balance of Recp    after  :", balances[_to]);
    return true;
  }

  function balanceOf(address _owner) public view returns (uint balance) {
    return balances[_owner];
  }
}