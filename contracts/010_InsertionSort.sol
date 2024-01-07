// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

// 控制流
contract InsertionSort {
    // if-else
    function ifElseTest(uint256 _number) public pure returns (bool) {
        if (_number == 0) {
            return (true);
        } else {
            return (false);
        }
    }

    // for循环
    function forLoopTest() public pure returns (uint256) {
        uint256 sum = 0;
        for (uint256 i = 0; i <= 10; i++) {
            sum += i;
        }
        return (sum);
    }

    // while循环
    function whileTest() public pure returns (uint256) {
        uint256 sum = 0;
        uint256 i = 0;
        while (i < 10) {
            sum += i;
            i++;
        }
        return (sum);
    }

    // do-while循环
    function doWhileTest() public pure returns (uint256) {
        uint256 sum = 0;
        uint256 i = 0;
        do {
            sum += i;
            i++;
        } while (i < 10);
        return (sum);
    }

    // 三元运算符 ternary/conditional operator
    function ternaryTest(uint256 x, uint256 y) public pure returns (uint256) {
        // return the max of x and y
        return x >= y ? x : y;
    }

    // 另外还有continue（立即进入下一个循环）和break（跳出当前循环）关键字可以使用。

    // 插入排序 错误版  [2, 5, 3, 1]
    function insertionSortWrong(uint256[] memory arr)
        public
        pure
        returns (uint256[] memory)
    {
        for (uint256 i = 1; i < arr.length; i++) {
            uint256 temp = arr[i];
            uint256 j = i - 1;
            while ((j >= 0) && (temp < arr[j])) {
                arr[j + 1] = arr[j];
                j--;
            }
            arr[j + 1] = temp;
        }
        return (arr);
    }

    // 插入排序 正确版
    function insertionSort(uint256[] memory arr)
        public
        pure
        returns (uint256[] memory)
    {
        // note that uint can not take negative value
        for (uint256 i = 1; i < arr.length; i++) {
            uint256 temp = arr[i];
            uint256 j = i;
            while ((j >= 1) && (temp < arr[j - 1])) {
                arr[j] = arr[j - 1];
                j--;
            }
            arr[j] = temp;
        }
        return (arr);
    }
}
