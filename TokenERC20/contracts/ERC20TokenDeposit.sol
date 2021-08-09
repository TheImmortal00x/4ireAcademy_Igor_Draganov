  
// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract TokenDeposit {
    IERC20 public coin;
    address private _owner;

    event Deposition(address sender, uint amount);
    event Withdraw(address sender, uint amount);

    mapping(address => uint) public balance;

    constructor(IERC20 token_) {
        coin = token_;
        _owner = msg.sender;
    }

    modifier ownerCheck() {
        require(msg.sender == _owner, "You don`t own this account.");
        _;
    }

    function deposit(uint amount) public {
        coin.transferFrom(msg.sender, address(this), amount);
        balance[msg.sender] += amount;
        emit Deposition(msg.sender, amount);
    }
    function availableToWithdraw() public view returns (uint) {
        return balance[msg.sender];
    }
    function withdraw(uint amount) public {
        require(balance[msg.sender] >= amount);
        balance[msg.sender] -= amount;
        coin.transfer(msg.sender, amount);
        emit Withdraw(msg.sender, amount);
    }
    function depositOwner(uint amount) public ownerCheck{
        coin.transferFrom(msg.sender, address(this), amount);
    }
    function withdrawOwner(uint amount) ownerCheck public {
        coin.transfer(msg.sender, amount);
    }
}