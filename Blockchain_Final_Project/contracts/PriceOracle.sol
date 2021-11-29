pragma solidity ^0.8.0;

//import chainlink oracle function
import "https://github.com/smartcontractkit/chainlink/blob/develop/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

contract PriceOracle {

    //component from chainlink's oracle
    AggregatorV3Interface internal priceFeed;
    
    //event to emit payout information
    event info(uint _currentPrice, uint _payout, uint _rewardPool);


    //intialize rewardpool count and payout
    uint public rewardPool;

    uint public payout;



    constructor() {
        //declaring pricefeed and reward pool
        //using chainlink bsc testnet on bnb/usd pair
        priceFeed = AggregatorV3Interface(0x2514895c72f50D8bd4B4F9b1110F0D6bD2c97526);
        //pretend that the reward pool have 100 BNB
        rewardPool =  100 * (10**8);
    }

    //function to get real time price from chainlink
    function getLatestPrice() public view returns (int) {
        (
            uint80 roundID, 
            int price,
            uint startedAt,
            uint timeStamp,
            uint80 answeredInRound
        ) = priceFeed.latestRoundData();
        return price;
    }

    //function to count payout, for this case we are trying to do a 10k usd payout
    function payout10000dollar() public{
        uint currentPrice = uint(getLatestPrice());
        payout = (10000*(10**8))/currentPrice;
        rewardPool -= payout;
        emit info(currentPrice, payout, rewardPool);
        }
        
}