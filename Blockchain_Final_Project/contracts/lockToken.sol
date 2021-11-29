pragma solidity ^0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/math/SafeMath.sol";
 
contract Timelock {

    //using SafeMath library
    using SafeMath for uint;
    

    //mapping address's balance
    mapping(address => uint) public balances;
  

    //mapping address's coin lock time
    mapping(address => uint) public lockTime;


    //mapping address's coin chances to play
    mapping(address => uint) public chances;    

    function deposit() public payable {

        //update balance
        balances[msg.sender] += msg.value;

        //updates locktime 4 week from now
        lockTime[msg.sender] = block.timestamp + 4 weeks;

        //updates number of chances, adding 1 chances every 0.01 coin staked
        chances[msg.sender] += msg.value/(0.01*(10**18));

    }

    //play function
    function play() public {
        
        //to play address need to have more than one chances
        require(chances[msg.sender] > 0, "you have no more chances");

        //decrease chances when using play function
        chances[msg.sender] -= 1;
    }

    //withdraw stacked balance
    function withdraw() public {

        // check that the sender has coin deposited in this contract in the mapping and the balance is >0
        require(balances[msg.sender] > 0, "Insufficient funds");

        // check that the now time is > the time saved in the lock time mapping
        require(block.timestamp > lockTime[msg.sender], "Lock time has not expired");

        // update the balance
        uint amount = balances[msg.sender];
        balances[msg.sender] = 0;

        // send the coin back to the sender
        (bool sent, ) = msg.sender.call{value: amount}("");
        require(sent, "Failed to send BNB");

    }
}