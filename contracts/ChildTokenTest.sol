// SPDX-License-Identifier: MIT

pragma solidity 0.7.5;

import "openzeppelin-solidity/contracts/token/ERC20/ERC20.sol";
import "openzeppelin-solidity/contracts/access/Ownable.sol";

contract ChildTestToken is ERC20("Test token", "TEST"), Ownable {
    address public childChainManager;

    modifier onlyChainManager {
        require(msg.sender == childChainManager, "only chain manager");
        _;
    }

    constructor(address _childChainManager) {
        transferOwnership(msg.sender);
        childChainManager = _childChainManager;
    }

    function updateChildChainManager(address _childChainManager) external onlyOwner {
        require(_childChainManager != address(0), "Invalid address");
        
        childChainManager = _childChainManager;
    }

    function deposit(address user, bytes calldata depositData) external onlyChainManager {
        uint256 amount = abi.decode(depositData, (uint256));

        super._mint(user, amount);
    }

    function withdraw(uint256 amount) external {
        super._burn(msg.sender, amount);
    }
}