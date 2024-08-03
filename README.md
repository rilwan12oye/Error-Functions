# ErrorContract
This is a simple solidity smart contract that registers users, fetch users and delete user. It showcase solidity power of error handling mechanism.

## Description
This smart contract shows the solidity error-handling mechanisms which are require, assert and revert.

The smart contract has 3 functions:

- registerUser: allows user to register. This functions uses the require and assert error-handling mechanism to make sure that the username is not short and age is greater than 17.
- getUser: allows a registered user to be viewed or fetched. It uses the revert error-handling to making sure only a registered used could be viewed.
- deleteUser: allows the owner (account that deploys the smart contract) to delete a registered user. It uses the require and revert to making sure that only owner can call the function and only registered user can be deleted respectively.

## Getting Started
### Executing program

- To interact with the project, locate the project here: [Error Contract](https://github.com/rilwan12oye/Error-Functions)
- When you find the project, in the contracts folder, you'll find ErrorContract.sol.
- Copy the contract and paste in it on remix: https://remix.ethereum.org/.
- Once you are on the Remix website, create a new file by clicking on the "+" icon in the left-hand sidebar. Save the file with a .sol extension (e.g., ErrorContract.sol). Copy and paste the following code into the file:
- To compile the code, click on the "Solidity Compiler" tab in the left-hand sidebar. Make sure the "Compiler" option is between "0.8.18;";  then click on the "Compile ErrorContract.sol" button.
- Once the code is compiled, you can deploy the contract by clicking on the "Deploy & Run Transactions" tab in the left-hand sidebar. Select the "ErrorContract" contract from the dropdown menu, and then click on the "Deploy" button.

- Once the contract is deployed, you can interact with it by calling the saveName and viewName function. Click on the "ErrorContract" contract in the left-hand sidebar, and then click on the "saveName" function with the needed parameters. Finally, click on the "transact" button to execute the function.

## Authors
Rilwan Oyewole

## License
This project is licensed under the MIT License - see the LICENSE.md file for details
