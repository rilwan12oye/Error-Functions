# ErrorContract
This is a simple solidity smart contract that adds users to a beneficiary list and users can come to claim their benefit - only beneficiary can claim their benefit and they can only claim that particular benefit once. The error-handling mechanism makes sure all these rules are met.

## Description
This smart contract shows the solidity error-handling mechanisms which are required, assert and revert.

The smart contract has 3 functions:

- addBenefitiary: allows owner of the contract to add users to the list of beneficiary. ```require``` makes sure only the owner can call this function. It also makes sure address zero is not added as beneficiary and the claim date is in the future. ```assert``` makes sure the benefit amount is greater than zero.
- claimBenefit: allows a beneficiary to claim their benefit. ```revert``` allows only a beneficiary to claim their benefit at the stipulated time and they can't claim that particular benefit more than once.
- yourBalance: allows user to check their balance after claiming their benefit 

## Getting Started
### Executing program

- To interact with the project, locate the project here: [Error Contract](https://github.com/rilwan12oye/Error-Functions)
- When you find the project, in the contracts folder, you'll find ErrorContract.sol.
- Copy the contract and paste it on remix: https://remix.ethereum.org/.
- Once you are on the Remix website, create a new file by clicking on the "+" icon in the left-hand sidebar. Save the file with a .sol extension (e.g., ErrorContract.sol). Copy and paste the following code into the file:
- To compile the code, click on the "Solidity Compiler" tab in the left-hand sidebar. Make sure the "Compiler" option is between "0.8.18;";  then click on the "Compile ErrorContract.sol" button.
- Once the code is compiled, you can deploy the contract by clicking on the "Deploy & Run Transactions" tab in the left-hand sidebar. Select the "ErrorContract" contract from the dropdown menu, and then click on the "Deploy" button.

- Once the contract is deployed, you can interact with it by calling the saveName and viewName function. Click on the "ErrorContract" contract in the left-hand sidebar, and then click on the "saveName" function with the needed parameters. Finally, click on the "transact" button to execute the function.

## Authors
Rilwan Oyewole

## License
This project is licensed under the MIT License - see the LICENSE.md file for details
