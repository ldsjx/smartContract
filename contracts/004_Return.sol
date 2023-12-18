// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

contract Return {
    // 返回多个变量
    // 命名式返回
    // 解构赋值

    // 命名式返回
    // 纯函数，不读取或修改合约状态 pure是一个关键字 可以不话费gas费用
    function returnNamed()
        public
        pure
        returns (
            uint256 _number,
            bool _bool,
            uint256[3] memory _array
        )
    {
        _number = 2;
        _bool = false;
        _array = [uint256(3), 2, 1];
    }

    // 命名式返回，依然支持return
    function returnNamed2()
        public
        pure
        returns (
            uint256 _number,
            bool _bool,
            uint256[3] memory _array
        )
    {
        return (1, true, [uint256(1), 2, 5]);
    }

    // 读取返回值，解构式赋值
    function readReturn()
        public
        pure
        returns (
            uint256,
            bool,
            bool,
            uint256[3] memory
        )
    {
        // 读取全部返回值
        uint256 _number;
        bool _bool;
        bool _bool2;
        uint256[3] memory _array;
        (_number, _bool, _array) = returnNamed();

        // 读取部分返回值，解构式赋值
        (, _bool2, ) = returnNamed();

        // 返回值
        return (_number, _bool, _bool2, _array);
    }
}
