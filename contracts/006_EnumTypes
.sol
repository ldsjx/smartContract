// SPDX-License-Identifier: MIT
pragma solidity >=0.8.2 <0.9.0;

contract EnumTypes {
    // 将uint 0， 1， 2表示为Buy, Hold, Sell
    enum ActionSet {
        Buy,
        Hold,
        Sell
    }
    // 创建enum变量 action
    ActionSet action = ActionSet.Hold;

    // enum可以和uint显式的转换
    function enumToUint() external view returns (uint256) {
        return uint256(action);
    }
}
