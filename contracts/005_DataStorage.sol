// SPDX-License-Identifier: MIT
pragma solidity >=0.8.2 <0.9.0;

contract DataStorage {
    // The data location of x is storage.
    // This is the only place where the
    // data location can be omitted.
    uint256[] public x = [1, 2, 3];

    function fStorage() public {
        //声明一个storage的变量xStorage，指向x。修改xStorage也会影响x
        uint256[] storage xStorage = x;
        xStorage[0] = 100;
    }

    function fMemory() public view returns (uint[] memory) {
        //声明一个Memory的变量xMemory，复制x。修改xMemory不会影响x
        uint[] memory xMemory = x;
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
