// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import {SimpleStorage} from "./SimpleStorage.sol";

contract StorageFactory {
    SimpleStorage[] public simpleStorageList;

    function createSimpleStorageContract() public {
        SimpleStorage newSimpleStorageContract = new SimpleStorage();
        simpleStorageList.push(newSimpleStorageContract);
    }

    function sfStore(uint256 _simpleStorageIndex, uint256 _favoriteNumber) public{
        SimpleStorage simpleStorage = simpleStorageList[_simpleStorageIndex];
        simpleStorage.store(_favoriteNumber);
    }

    function sfGet(uint256 _simpleStorageIndex) public view returns (uint256){
        SimpleStorage simpleStorage = simpleStorageList[_simpleStorageIndex];
        return simpleStorage.retrieve();
    }
}
