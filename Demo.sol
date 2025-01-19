// Написать лезензию важно - MIT для опенсорса
// SPDX-License-Identifier: MIT 

pragma solidity ^0.8.0; //указываем какую версию языка используем

// Обьявлеяем контракт
contract MyShop {

// Владелец контракта
    address public owner;
    mapping (address => uint) public payments;

    constructor() {
        owner = msg.sender;
    }

    // Зачисление денег проводиться автоматически - у контракта есть не только свой адресс, но есть и счет
    function payForItem() public payable { // paybale - функция может работать с деньгами
        payments[msg.sender] = msg.value; // value это то сколько денег было в транзакции
    }

    function withdrawAll() public {
        address payable  _to = payable(owner);
        address _thisContract = address(this);
        _to.transfer(_thisContract.balance);
    }

} 
