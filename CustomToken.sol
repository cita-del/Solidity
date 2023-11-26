// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract CustomToken is ERC20, Ownable {
    constructor(address initialOwner) ERC20("CustomToken", "CTK") Ownable(initialOwner) {
        _mint(msg.sender, 300 * 10**18); 
    }

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    function transfer(address to, uint256 amount) public override returns (bool) {
        _transfer(msg.sender, to, amount);
        return true;
    }
    function burn(uint256 amount) public {
        _burn(msg.sender, amount);
    }
}
