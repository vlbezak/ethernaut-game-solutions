// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

//Password that was retrieved using console:
// await web3.eth.getStorageAt('0x90910e88294a13D401fB9e106439E119e4C43328',1)  
//'0x412076657279207374726f6e67207365637265742070617373776f7264203a29'

contract Vault {
  bool public locked;
  bytes32 private password;

  constructor(bytes32 _password) {
    locked = true;
    password = _password;
  }

  function unlock(bytes32 _password) public {
    if (password == _password) {
      locked = false;
    }
  }
}