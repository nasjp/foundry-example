// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "../src/OwnerUpOnly.sol";

abstract contract HelperContract {
    OwnerUpOnly public ownerUpOnly;
}

contract CounterTest is Test, HelperContract {
    function setUp() public {
        ownerUpOnly = new OwnerUpOnly();
    }

    function testIncrementAsNotOwner() public {
        vm.expectRevert(Unauthorized.selector);
        vm.prank(address(0));
        ownerUpOnly.increment();
    }
}
