// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

/* 
继承树：
  God
 /  \
Adam Eve
 \  /
people
在多重+菱形继承链条上使用super关键字时，需要注意的是使用super会调用继承链条上的每一个合约的相关函数，而不是只调用最近的父合约。

我们先写一个合约God，再写Adam和Eve两个合约继承God合约，最后让创建合约people继承自Adam和Eve，每个合约都有foo和bar两个函数。
*/

contract God {
    event Log(string message);

    function foo() public virtual {
        emit Log("God.foo called");
    }

    function bar() public virtual {
        emit Log("God.bar called");
    }
}

contract Adam is God {
    function foo() public virtual override {
        emit Log("Adam.foo called");
        super.foo();
    }

    function bar() public virtual override {
        emit Log("Adam.bar called");
        super.bar();
    }
}

contract Eve is God {
    function foo() public virtual override {
        emit Log("Eve.foo called");
        super.foo();
    }

    function bar() public virtual override {
        emit Log("Eve.bar called");
        super.bar();
    }
}

// 在这个例子中，调用合约people中的super.bar()会依次调用Eve、Adam，最后是God合约。
contract people is Adam, Eve {
    function foo() public override(Adam, Eve) {
        super.foo();
    }

    function bar() public override(Adam, Eve) {
        super.bar();
    }
}
