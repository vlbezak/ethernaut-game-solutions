# King

## Try to break the contract

Everyone who sends bigger amount of Eth to contract becomes the new king, and the amount is sent to previous king

When the level is submitted, the level will become the king. Try to break the contract so that the level contract will not be able to claim ownership.


## Explanation:
* Create a new contract KingHack
    * kingContractAddress - address of King contract in constructor
* When the contract is deployed (add some value of ether, bigger than curent King prize during deployment) - it tries to send ether to King contract (amount equals or bigger than current prize). By doing so, our KingHack will become new king
* KingHack does not have any fallback or receive method, therefore it cannot recevie ether.
* When the level is submitted, and level contract tries to set the king in King contract, it will first try to send the prize to previous king (which is our KingHack), but it will fail (because no fallback).
* So our KingHack will stay as king forewer.
