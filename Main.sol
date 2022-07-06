// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

// PROPRT.io dependencies
import "./security/Pausable.sol";
import "./access/Ownable.sol";
import "./ERC20.sol";

contract REST is ERC20, Pausable, Ownable {
    constructor() ERC20("Real Estate", "REST") {
        _mint(msg.sender, 100000000 * 10 ** decimals());
    }

    function pause() public onlyOwner {
        _pause();
    }

    function unpause() public onlyOwner {
        _unpause();
    }

    function _beforeTokenTransfer(address from, address to, uint256 amount)
        internal
        whenNotPaused
        override
    {
        super._beforeTokenTransfer(from, to, amount);
    }
}
