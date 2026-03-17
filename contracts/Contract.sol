```solidity
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/security/ReentrancyGuard.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

/// @title TON Micro-Payment Bot
/// @author [Your Name]
/// @notice Telegram bot for instant TON micropayments with AI task completion marketplace
contract TONMicroPaymentBot is ReentrancyGuard, Ownable {
    /// @notice Mapping of user balances
    mapping(address => uint256) public userBalances;

    /// @notice Event emitted when a user deposits TON
    /// @param user The user who deposited TON
    /// @param amount The amount of TON deposited
    event Deposit(address indexed user, uint256 amount);

    /// @notice Event emitted when a user completes a task
    /// @param user The user who completed the task
    /// @param taskId The ID of the completed task
    event TaskCompleted(address indexed user, uint256 taskId);

    /// @notice Constructor
    /// @param _owner The owner of the contract
    constructor(address _owner) {
        transferOwnership(_owner);
    }

    /// @notice Deposit TON into the contract
    /// @param _amount The amount of TON to deposit
    function deposit(uint256 _amount) public nonReentrant {
        userBalances[msg.sender] += _amount;
        emit Deposit(msg.sender, _amount);
    }

    /// @notice Complete a task and receive a reward
    /// @param _taskId The ID of the task to complete
    function completeTask(uint256 _taskId) public nonReentrant {
        // TO DO: implement task completion logic
        emit TaskCompleted(msg.sender, _taskId);
    }

    /// @notice Withdraw TON from the contract
    /// @param _amount The amount of TON to withdraw
    function withdraw(uint256 _amount) public nonReentrant onlyOwner {
        require(userBalances[msg.sender] >= _amount, "Insufficient balance");
        userBalances[msg.sender] -= _amount;
        payable(msg.sender).transfer(_amount);
    }
}
```