// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Chapter 1 - Basic Data Types: Enums
contract Contract {
    enum Foods { Apple, Pizza, Bagel, Banana }

    Foods public food1 = Foods.Apple;
    Foods public food2 = Foods.Pizza;
    Foods public food3 = Foods.Bagel;
    Foods public food4 = Foods.Banana;
}
