# Vault

try to unlock the vault

## Explanation:
* Event when the password is private, it can be visible on blockchain
* In console you can check the storage location
* await web3.eth.getStorageAt('0x90910e88294a13D401fB9e106439E119e4C43328',1)
    * where 0x90910e88294a13D401fB9e106439E119e4C43328 is contract address (level instance)
    * 1 - is storage id (password) 
* Deploy the contract 08-Vault in Remix at address 0x90910e88294a13D401fB9e106439E119e4C43328, and call unlock with value retrieved using the getStorageAt ... 