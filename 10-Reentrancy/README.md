# Reentrancy

## Try to steal all ether from the contract

Contract Reentrace is deployed by ethernaut level with 0.001 ether
Try to steal it


## Explanation:
* Create a new contract ReentranceHack, pointing to original Reentrace contract
* Implement fallback/receive to call back Reentrace.withdraw with lower/equal amount of ether than the ReentraceHack contract has in balanceOf(address(ReentranceHack)).

* For this to be successful, you first need to donate the Reentrace contract with some ether
* You can do it via donate method on ReentranceHack - but set some value...
* Then you can run attack method - this will try to withdraw eth balance from Reentrance
* it will check the balanceOf RenetranceHack, and it will be equal (because we donated it)
* But withdrawal of eth to RenetranceHack will invoke ReentranceHack.fallback, which in turn will again call Reentrancewithdraw, which will again invoke ReentranceHack.fallback, and so on ... until the Reentrance contract is depleted
