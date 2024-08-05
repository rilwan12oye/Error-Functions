
# ErrorContract

This Solidity program is a simple smart contract that adds users to a beneficiary list and users can come to claim their benefit - only beneficiary can claim their benefit and they can only claim that particular benefit once. The error-handling mechanism makes sure all these rules are met. The purpose of this program is to show the error-handling mechanisms of the Solidity programming language.

## Description

This program is a simple contract written in Solidity, a programming language used for developing smart contracts on the Ethereum blockchain. The contract has three functions as listed below.

- addBenefitiary: allows owner of the contract to add users to the list of beneficiary. ```require``` makes sure only the owner can call this function. It also makes sure address zero is not added as beneficiary and the claim date is in the future. ```assert``` makes sure the benefit amount is greater than zero.
- claimBenefit: allows a beneficiary to claim their benefit. ```revert``` allows only a beneficiary to claim their benefit at the stipulated time and they can't claim that particular benefit more than once.
- yourBalance: allows user to check their balance after claiming their benefit 

## Getting Started

### Executing program

To run this program, you can use Remix, an online Solidity IDE. To get started, go to the Remix website at https://remix.ethereum.org/.

Once you are on the Remix website, create a new file by clicking on the "+" icon in the left-hand sidebar. Save the file with a .sol extension (e.g., ErrorContract.sol). Copy and paste the following code into the file:

```javascript
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract Claims {


    address immutable owner;

    struct Beneficiary {
        address user;
        uint256 amount;
        uint256 claimTime;
        bool claimed;
    }

    mapping (address => Beneficiary) public beneficiaries;
    mapping (address => uint256) balances;

    event BeneficiaryAdded(address beneficiary, uint256 amount, uint256 claimTime);
    event Claimed(address beneficiary, uint256 amount, uint256 claimTime);

    constructor () {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only Owner");
        _;
    }

    function addBenefitiary(address _recipient, uint256 _amount, uint256 _time) external onlyOwner {
        
        require(_recipient != address(0), "Address zero not allowed");
        uint256 _claimTime = block.timestamp + _time;
        require(_claimTime > block.timestamp, "Claim time must in future");

        assert(_amount > 0);

        beneficiaries[_recipient] = Beneficiary(_recipient, _amount, _claimTime, false);

        emit BeneficiaryAdded(_recipient, _amount, _claimTime);
    }

    function claimBenefit() external {
        Beneficiary storage _beneficiary = beneficiaries[msg.sender];

        if (_beneficiary.user == address(0)) revert("You are not a beneficiary");
        if (_beneficiary.claimTime > block.timestamp) revert("Not yet time!!!");
        if (_beneficiary.claimed) revert("Benefit claimed already!");

        _beneficiary.claimed = true;

        balances[msg.sender] = _beneficiary.amount;
        emit Claimed(_beneficiary.user, _beneficiary.amount, block.timestamp);
    }

    function yourBalance() external view returns(uint256) {
        uint256 _balance = balances[msg.sender];
        require(_balance > 0, "You have no balance");
        return _balance;
    }
}

```

To compile the code, click on the "Solidity Compiler" tab in the left-hand sidebar. Make sure the "Compiler" option is set to "0.8.17" (or another compatible version), and then click on the "Compile ErrorContract.sol" button.

Once the code is compiled, you can deploy the contract by clicking on the "Deploy & Run Transactions" tab in the left-hand sidebar. Select the "ErrorContract" contract from the dropdown menu, and then click on the "Deploy" button.

Once the contract is deployed, you can interact with it the contract.

## Authors

Rilwan Oyewole

## License

This project is licensed under the MIT License - see the LICENSE.md file for details
