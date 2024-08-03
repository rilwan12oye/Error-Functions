// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract ErrorContract {

    error NOT_REGISTERED(address);

    uint256 public numberOfReg;
    address immutable owner;

    struct UserDetails {
        address user;
        string username;
        uint8 age;
    }

    mapping(address => UserDetails) userDetails;

    event Registered(
        address indexed user,
        string indexed username,
        uint256 indexed age
    );

    event Deleted(address indexed user);

    constructor() {
        owner = msg.sender;
    }

    modifier increaseNo() {
        _;
        numberOfReg += 1;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner allowed!");
        _;
    }

    modifier isRegistered(address _user) {
        if (userDetails[_user].user == address(0)) revert NOT_REGISTERED(_user);
        _;
    }

    function registerUser(string memory _username, uint8 _age)
        public
        increaseNo
    {
        address _user = msg.sender;
        require(
            userDetails[_user].user == address(0),
            "You are already registered!"
        );
        require(bytes(_username).length > 1, "Username too short");
        assert(_age > 17);

        userDetails[_user] = UserDetails(_user, _username, _age);
        emit Registered(_user, _username, _age);
    }

    function getUser(address _user) external view isRegistered(_user) returns (UserDetails memory) {

        return userDetails[_user];
    }

    function deleteUser(address _user) external onlyOwner isRegistered(_user) returns (bool) {
        delete userDetails[_user];

        numberOfReg -= 1;

        emit Deleted(_user);
        
        return true;
    }
}
