//SPDX-License-Identifier:MIT
pragma solidity ^0.7.0;

contract bank{
    mapping (address => uint ) account;
    mapping (address=>bool) exist;

    function create_account()public payable
    {
        require(exist[msg.sender]==false);
        account[msg.sender]=msg.value;
        exist[msg.sender]=true;
    }

    function get_balance()public view returns(uint)
    {
        require(exist[msg.sender]==true);
        return account[msg.sender];
    }

    function deposit(uint amount)public payable 
    {
        require(exist[msg.sender]==true && amount>0);
        account[msg.sender]+= msg.value;
    }

    function transfer(address payable to,uint amount)public payable 
    {
        require(exist[msg.sender]==true && account[msg.sender] >= amount && amount>0);
        require(exist[to]==true);
        account[msg.sender]-=amount;
        account[to]+=msg.value;

    }

    function withdraw(uint amount)public payable
    {
        require(exist[msg.sender]==true && amount>0 && account[msg.sender]>=amount);
        account[msg.sender]-=amount;

    }
}
