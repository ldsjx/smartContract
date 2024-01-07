// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

// 修饰器的继承
contract Base1 {
    // 修饰器
    modifier exactDividedBy2And3(uint256 _a) virtual {
        require(_a % 2 == 0 && _a % 3 == 0);
        // _; 这是修饰器的一个特殊符号，表示目标函数的实际执行位置。在这里，它表示当通过了 require 检查之后，继续执行目标函数。
        // 目标函数是调用了修饰器的函数。当调用这个函数时，会首先执行修饰器中的逻辑，包括 require 检查，如果检查通过（即 _a 是2和3的倍数），则会继续执行目标函数的实际逻辑。
        _;
    }
}

contract Identifier is Base1 {
    // 计算一个数分别被2除和被3除的值，但是传入的参数必须是2和3的倍数
    function getExactDividedBy2And3(uint256 _dividend)
        public
        pure
        exactDividedBy2And3(_dividend)
        returns (uint256, uint256)
    {
        return getExactDividedBy2And3WithoutModifier(_dividend);
    }

    // 计算一个数分别被2除和被3除的值
    function getExactDividedBy2And3WithoutModifier(uint256 _dividend)
        public
        pure
        returns (uint256, uint256)
    {
        uint256 div2 = _dividend / 2;
        uint256 div3 = _dividend / 3;
        return (div2, div3);
    }
}
