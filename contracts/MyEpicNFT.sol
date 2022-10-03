// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.17;

// Import OpenZepplin Contracts
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

// Import hardhat
import "hardhat/console.sol";

// Inherit imported contract to inherit contract's methods 

contract MyEpicNFT is ERC721URIStorage {
    // Keep track of tokenIds
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds; 

    // Pass NFT token name and symbol
    constructor() ERC721 ("MegNFT", "MEG") {
        console.log("Another Contract is here. Don't Call it a comeback!");
    }

    // Function for users to pick their NFT
    function makeAnEpicNFT() public {
        // Get the current tokenId, this starts at 0
        uint256 newItemId = _tokenIds.current(); 

        // Mint NFT to the sender using msg.sender
        _safeMint(msg.sender, newItemId); 

        // Set NFTs data for Meg
        _setTokenURI(newItemId, "https://jsonkeeper.com/b/6RL5"); 
        console.log("An NFT w/ ID %s has been minted to %s", newItemId, msg.sender); 

        // Increment the counter for when the next NFT is minted 
        _tokenIds.increment(); 
    }
}