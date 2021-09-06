// SPDX-License-Identifier: MIT

pragma solidity 0.7.5;

import "openzeppelin-solidity/contracts/token/ERC20/ERC20.sol";
import "openzeppelin-solidity/contracts/access/Ownable.sol";

contract TestToken is ERC20("USD Coin", "USDC"), Ownable {

    enum TYPE {
        NATIVE_COIN_NFT_721,
        NATIVE_COIN_NFT_1155,
        ERC_20_NFT_721, 
        ERC_20_NFT_1155
    }

    event SporesNFTMarketTransaction(
        address indexed _buyer,
        address indexed _seller,
        address _paymentReceiver,
        address _contractNFT,
        address _paymentToken,
        uint256 indexed _tokenId,
        uint256 _price,
        uint256 _amount,
        uint256 _fee,
        TYPE _tradeType
    );

    constructor() {
        transferOwnership(msg.sender);
    }

    function emitEvent(
        address _buyer,
        address _seller,
        address _paymentReceiver,
        address _contractNFT,
        address _paymentToken,
        uint256 _tokenId,
        uint256 _price,
        uint256 _amount,
        uint256 _fee,
        TYPE _tradeType
    ) external {
        emit SporesNFTMarketTransaction(_buyer, _seller, _paymentReceiver, _contractNFT, _paymentToken, _tokenId, _price, _amount, _fee, _tradeType);
    }


    function mint(address to, uint256 amount) external onlyOwner {
        super._mint(to, amount);
    }

    function burn(uint256 amount) external {
        super._burn(msg.sender, amount);
    }
}