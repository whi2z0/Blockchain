// SPDX-License-Identifier: MIT
pragma solidity >0.7.0 <0.9.0;

contract Marketplace {
    address public seller;
    address public buyer;
    mapping (address => uint) public balances;

    event ListItem(address seller, uint price);
    event PurchasedItem(address seller, address buyer, uint price);

    enum StateType {
          ItemAvailable,
          ItemPurchased
    }

    StateType public State;

    constructor() {
        seller = msg.sender;
        State = StateType.ItemAvailable;
    }

     function buy(address sellerAddress, address buyerAddress, uint price) public payable {
        require(price <= balances[buyerAddress], "Insufficient balance");
        State = StateType.ItemPurchased;
        balances[buyerAddress] -= price;
        balances[sellerAddress] += price;

        emit PurchasedItem(sellerAddress, buyerAddress, msg.value);
    }
}
