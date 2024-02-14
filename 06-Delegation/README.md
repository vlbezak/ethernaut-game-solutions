# Delegation

try to get ownership of Delegation contract

## Explanation:
* Encode the method pwn() with DelegateHack.getSignatureOf("pwn()")
* The result of this encoding is 0xdd365b8b
* In console do: await contract.sendTransaction({data:"0xdd365b8b"});
* After the transaction is mined - the owner will be set.
* 
* This is because the fallback for Delegation will be invoked with message sender as player address and with msg.data as encoded "pwn()"
* Delegation contract will call Delegate contract (not normal call but delegatecall) it will try to call pwn() function
* But because it is delegate call, the owner will not be set on Delegate, but on Delegation (the context will be used from Delegation)

