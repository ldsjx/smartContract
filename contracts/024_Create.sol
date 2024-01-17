// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

//WBNB地址: 0xbb4CdB9CBd36B01bD1cBaEBF2De08d9173bc095c
//BSC链上的PEOPLE地址: 0x2c44b726ADF1963cA47Af88B284C06f30380fC78

contract Pair {
    address public factory; // 工厂合约地址
    address public token0; // 代币1
    address public token1; // 代币2

    // 定义一个事件
    event LogEvent(string _str, address indexed sender);

    constructor() payable {
        factory = msg.sender;
        emit LogEvent("Contract deployed", msg.sender);
    }

    // called once by the factory at time of deployment
    function initialize(address _token0, address _token1) external {
        require(msg.sender == factory, "UniswapV2: FORBIDDEN"); // sufficient check
        token0 = _token0;
        token1 = _token1;
    }
}

contract PairFactory {
    mapping(address => mapping(address => address)) public getPair; // 通过两个代币地址查Pair地址
    address[] public allPairs; // 保存所有Pair地址

    function createPair(address tokenA, address tokenB)
        external
        returns (address pairAddr)
    {
        // 创建新合约
        Pair pair = new Pair();
        // 调用新合约的initialize方法
        pair.initialize(tokenA, tokenB);
        // 更新地址map
        pairAddr = address(pair);
        allPairs.push(pairAddr);
        getPair[tokenA][tokenB] = pairAddr;
        getPair[tokenB][tokenA] = pairAddr;
    }
}
