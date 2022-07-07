// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

// PROPRT.io dependencies
import "./security/Pausable.sol";
import "./access/Ownable.sol";
import "./ERC20.sol";
import "./extensions/ERC20Permit.sol";
import "./extensions/ERC20Votes.sol";


contract RealEstate is ERC20, Pausable, Ownable, ERC20Permit, ERC20Votes {
    constructor() ERC20("Real Estate", "REST") ERC20Permit("Real Estate") {
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

    // The following functions are overrides required by Solidity.

    function _afterTokenTransfer(address from, address to, uint256 amount)
        internal
        override(ERC20, ERC20Votes)
    {
        super._afterTokenTransfer(from, to, amount);
    }

    function _mint(address to, uint256 amount)
        internal
        override(ERC20, ERC20Votes)
    {
        super._mint(to, amount);
    }

    function _burn(address account, uint256 amount)
        internal
        override(ERC20, ERC20Votes)
    {
        super._burn(account, amount);
    }
}