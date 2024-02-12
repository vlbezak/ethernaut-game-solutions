# CoinFlip 

try to guess coin flip (0/1) ten times in a row

## Explanation:
We can create another contract (CoinFlipHack) that duplicates part of the logic of CoinFlip that computes the result 1/0 - true/false.

With this result we call original **CoinFlip.flip()** contract.

Also we can check if the result of CoinFlip.flip() is true/false.

* If it is **false** - we revert
* If it is **true** - we were able to guess the number
