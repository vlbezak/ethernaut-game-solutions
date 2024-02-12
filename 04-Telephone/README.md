# Telephone

try to take ownership of a Telephone contract

## Explanation:
* We can create and deploy another contract (Caller) which we are owner - we set owner address (ours) to storage - variable **owner**
* We call Caller.call(telephoneContractAddress)
    * This means that transaction originates in our address (that is storage variable **owner**)
    * Inside Caller.call(), we call Telephone.changeOwner(**owner**) - with our owner address, that was previously stored
* What happens in Telephone.changeOwner:
    * msg.sender - address of Caller contract
    * tx.origin - address of originator of transaction (our address)
    * owner - input variable - our address (that address that we used as input parameter in Telephone.changeOwner)
* This meand that msg.sender != tx.origin and we can successfully set the owner of Telephone contract