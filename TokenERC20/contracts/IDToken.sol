// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";

contract IDToken is ERC20, ERC20Burnable{
    constructor() ERC20("Initial D", "ID") {
        _mint(msg.sender, 1000);
    }   
}