// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract MyNFT {
    address public owner;
    uint256 private _nextTokenId;

    modifier onlyOwner {
        require(msg.sender == owner, "MyNFT: caller is not the owner");
        _;
    }

    constructor(string memory name_, string memory symbol_) {
        owner = msg.sender;
    }

    function mint(address to) external onlyOwner returns (uint256) {
        uint256 tokenId = _nextTokenId++;
        _safeMint(to, tokenId, data);
        return tokenId;
    }

    function burn(uint256 tokenId) external {
        require(ownerOf(tokenId) == msg.sender, "MyNFT: caller is not token owner");
        _burn(tokenId);
    }

}