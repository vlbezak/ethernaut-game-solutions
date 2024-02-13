# Token

try to increase the number of your tokens

## Explanation:
* This is a solidity 0.6.0 version - which does not have SafeMath, therefore we can make use of overflow/underflow 

* Call the Token.transfer() with player address and amount that is greater then sender balance
* this will cause overflow and player balance will be increased 
