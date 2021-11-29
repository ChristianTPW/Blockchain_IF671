pragma solidity ^0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC721/ERC721.sol";

contract crowdfunding is ERC721 {

    uint public maxSupply;
    uint public lastMinted;
    uint public currentSupply;

    mapping(address => uint) public balances;

    address owner;

    constructor () public ERC721("Sawah Pak Budi", "SPB1"){
        maxSupply = 100;
        lastMinted = 0;
        currentSupply = 1;

        _safeMint(msg.sender, lastMinted);
        
        lastMinted += 1;
        owner = msg.sender;
    }

    function mint() public {
        require(currentSupply < maxSupply, "Mint failed, max Supply has been reached");
        _safeMint(msg.sender, lastMinted);
        currentSupply += 1;
        lastMinted += 1;
    }

    function airdrop(uint airdropAmount) public{
        require(msg.sender == owner, "You are not the owner");
        for(uint i=0; i<lastMinted; i++){
            address nftOwner = ownerOf(i);
            balances[nftOwner] += airdropAmount;
        }
    }


}