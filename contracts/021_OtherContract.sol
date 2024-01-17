// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

contract OtherContract {
    uint256 private _x = 0; // 状态变量_x
    // 收到eth的事件，记录amount和gas
    event Log(uint256 amount, uint256 gas);

    // 返回合约ETH余额
    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }

    // 可以调整状态变量_x的函数，并且可以往合约转ETH (payable)
    function setX(uint256 x) external payable {
        _x = x;
        // 如果转入ETH，则释放Log事件
        if (msg.value > 0) {
            emit Log(msg.value, gasleft());
        }
    }

    // 读取_x
    function getX() external view returns (uint256 x) {
        x = _x;
    }
}

contract CallContract {
    function callSetX(address _Address, uint256 x) external {
        OtherContract(_Address).setX(x);
    }

    function CallGetX(OtherContract _Address)
        external
        view
        returns (uint256 x)
    {
        return x = _Address.getX();
    }

    function callGetX2(address _Address) external view returns (uint256 x) {
        OtherContract oc = OtherContract(_Address);
        return x = oc.getX();
    }

    function setXTransferETH(address otherContract, uint256 x)
        external
        payable
    {
        OtherContract(otherContract).setX{value: msg.value}(x);
    }
}
