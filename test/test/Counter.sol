// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test} from "forge-std/Test.sol";
import {Counter} from "../src/Counter.sol";

contract CounterTest is Test {
    Counter public counter;

    function setUp() external {
        counter = new Counter();
    }

    function test_increment() external {
        uint256 initialNumber = counter.number();

        counter.increment();

        assertEq(counter.number(), initialNumber + 1);
    }

    function test_setNumber() external {
        uint256 newNumber = 42;

        counter.setNumber(newNumber);

        assertEq(counter.number(), newNumber);
    }

    // test that runs multimple times with random inputs
    function testFuzz_setNumber(uint256 newNumber) external {
        counter.setNumber(newNumber);
        // vm.assume(x > 200 && x < 300); use this interval if you want to limit the range of newNumber
        assertEq(counter.number(), newNumber);
    }
}
