// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

// 函数重载

contract Overloading {
    function saySomething() public pure returns (string memory) {
        return ("Nothing");
    }

    function saySomething(string memory something)
        public
        pure
        returns (string memory)
    {
        return (something);
    }
}
