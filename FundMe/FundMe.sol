// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {PriceConverter} from "./PriceConverter.sol";

contract FundMe {
    using PriceConverter for uint256;

    uint256 public constant MINIMUM_USD = 1 * 1e18;
    address[] public funders;
    mapping(address => uint256) public addressToAmount;

    address public immutable owner;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Must be the contract owner!");
        _;
    }

    function fund() public payable {
        require(
            msg.value.getConversionRate() >= MINIMUM_USD,
            "You must fund 1 USD at minimum."
        );
        funders.push(msg.sender);
        addressToAmount[msg.sender] += msg.value;
    }

    function withdraw() public onlyOwner {
        for (uint256 i = 0; i < funders.length; i++) {
            addressToAmount[funders[i]] = 0;
        }
        funders = new address[](0);

        (bool callSuccess, ) = payable(msg.sender).call{
            value: address(this).balance
        }("");

        require(callSuccess, "Call failed");
    }

    receive() external payable {
        fund();
    }

    fallback() external payable {
        fund();
    }
}
