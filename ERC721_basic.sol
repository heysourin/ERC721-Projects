// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.9;

contract MyToken {
    string _tokenName;
    string _symbol;

    mapping(uint => address) _owners; //owner[tokenId] = address

    mapping(address => uint) _balance; //balamce[address] = tokenId

    constructor(string memory tokenName_, string memory symbol_) {
        _tokenName = tokenName_;
        _symbol = symbol_;
    }

    function name() public view returns (string memory) {
        return _tokenName;
    }

    function symbol() public view returns (string memory) {
        return _symbol;
    }

    function getOwner(uint tokenId) public view returns (address) {
        return _owners[tokenId];
    }

    function checkBalance(address _user) public view returns (uint) {
        return _balance[_user];
    } //* If this function returns balance = 2 for any address, that means that account holds two different tokens

    function mint(uint tokenId_) public{
        _owners[tokenId_] = msg.sender;
        _balance[msg.sender] += 1;
    }

    function transfer(address _to, uint tokenId) public{
        _owners[tokenId] = _to;
        _balance[_to] += 1;
        _balance[msg.sender] -= 1; 
    }
}
