pragma solidity ^0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";

contract Token is ERC20{
    //making a simple token with OpenZeppelin library
    constructor () public ERC20("ERC20 Token", "E20T"){
        _mint(msg.sender, 1000000 * (10 ** uint256(decimals())));
    }
}
