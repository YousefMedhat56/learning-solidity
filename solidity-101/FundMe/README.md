# FundMe Project
The FundMe project is a crowdfunding smart contract. 
This project highlights the use of external libraries, modifiers, and efficient contract management practices.
## Components
### 1. PriceConverter Library
Provides utility functions to fetch the current ETH/USD price from a Chainlink price feed and convert Ether values into USD.

### 2. FundMe Contract
Implements a crowdfunding contract where users can fund the contract with Ether, and the contract owner can withdraw the funds.

## Learning outcomes
### 1. Interacting with oracles
Learn to use Chainlink oracles to fetch real-world data, such as ETH/USD prices.
### 2. Custom Libraries
Understand how to create reusable libraries like PriceConverter to extend the functionality of primitive types in Solidity.
### 3. Modifiers
Learn what are modifiers and how to use them.
### 4. Constants and Immutables
Learn how to optimize gas by using `constant` and `immutable` keywords.
### 5. Recieve and Fallback functions
Learn how to use `receive` and `fallback` functions.
