# Force

try to increase balance of contract, that does not have any payable functions, and no fallback/no receive

## Explanation:
* We can send balance of contract to any address via selfdestruct
* Deploy the contract ForceHack with Force address (supply some ether via payable constructor, or via fallback/receive methods).
* Call ForceHack.trySendingToNonPayable - this will call selfdestruct on ForceHack, which will send ether to address supplied in constructor
