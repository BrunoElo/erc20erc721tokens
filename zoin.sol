// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts@4.5.0/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts@4.5.0/access/Ownable.sol";

contract Zoin is ERC20, Ownable {
    constructor() ERC20("Zoin", "ZOIN") {
        _mint(msg.sender, 100000 * 10 ** decimals());
    }

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    function buyToken(address receiver) public payable {
        require(msg.value > 0 , "ETH is needed to mint tokens");
        uint256 tokensInZoin = (msg.value / 10 ** 18) * 1000 * 10 ** decimals();
        mint(receiver, tokensInZoin);
    }
}
