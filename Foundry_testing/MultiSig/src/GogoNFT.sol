// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;
import {ERC721} from "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import {ERC721URIStorage} from "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";

contract GogoNFT is ERC721, ERC721URIStorage {
    uint256 private tokenIdCounter;

    constructor () ERC721("GogoNFT", "GOC") {

    }
    
    function mint(address to, string memory _tokenURI) external {
        tokenIdCounter++;
        _safeMint(to, tokenIdCounter);
        _setTokenURI(tokenIdCounter, _tokenURI);//
    }

    function tokenURI(uint256 tokenId) public view virtual override(ERC721URIStorage, ERC721) returns (string memory) {
       return super.tokenURI(tokenId);
    }
    function supportsInterface(bytes4 interfaceId) public view virtual override(ERC721URIStorage, ERC721) returns (bool) {
        return super.supportsInterface(interfaceId);
    }
}
