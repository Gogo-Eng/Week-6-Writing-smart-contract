// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^5.6.0
pragma solidity ^0.8.20;
import {ERC721} from "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";

contract AmyNFT is ERC721, Ownable {
    uint256 private tokenIdCounter;
    string private BaseURI;

    constructor (string memory _BaseURI) ERC721("AmyNFT", "AMY") Ownable(msg.sender) {
        _BaseURI = _BaseURI;
    }
    
}

// import {ERC721URIStorage} from "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";

// contract AmyNFT is ERC721, ERC721URIStorage, Ownable {
//     constructor(address initialOwner)
//         ERC721("MyToken", "MTK")
//         Ownable(initialOwner)
//     {}

//     function safeMint(address to, uint256 tokenId, string memory uri)
//         public
//         onlyOwner
//     {
//         _safeMint(to, tokenId);
//         _setTokenURI(tokenId, uri);
//     }

//     // The following functions are overrides required by Solidity.

//     function tokenURI(uint256 tokenId)
//         public
//         view
//         override(ERC721, ERC721URIStorage)
//         returns (string memory)
//     {
//         return super.tokenURI(tokenId);
//     }

//     function supportsInterface(bytes4 interfaceId)
//         public
//         view
//         override(ERC721, ERC721URIStorage)
//         returns (bool)
//     {
//         return super.supportsInterface(interfaceId);
//     }
// }