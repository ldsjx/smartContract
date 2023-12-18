// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

contract DataStorage {
    // The data location of x is storage.
    // This is the only place where the
    // data location can be omitted.

    // Solidity数据存储位置有三类：storage，memory和calldata。不同存储位置的gas成本不同。storage类型的数据存在链上，类似计算机的硬盘，消耗gas多；memory和calldata类型的临时存在内存里，消耗gas少。大致用法：

    // storage：合约里的状态变量默认都是storage，存储在链上。

    // memory：函数里的参数和临时变量一般用memory，存储在内存中，不上链。

    // calldata：和memory类似，存储在内存中，不上链。与memory的不同点在于calldata变量不能修改（immutable），一般用于函数的参数。例子：
    uint256[] public x = [1, 2, 3];

    function fStorage() public {
        //声明一个storage的变量xStorage，指向x。修改xStorage也会影响x
        uint256[] storage xStorage = x;
        xStorage[0] = 100;
    }

    function fMemory() public view returns (uint256[] memory) {
        //声明一个Memory的变量xMemory，复制x。修改xMemory不会影响x
        uint256[] memory xMemory = x;
        xMemory[0] = 100;
        xMemory[1] = 200;
        return xMemory;
    }

    function fCalldata(uint256[] calldata _x)
        public
        pure
        returns (uint256[] calldata)
    {
        //参数为calldata数组，不能被修改
        // _x[0] = 0 //这样修改会报错
        return (_x);
    }
}
