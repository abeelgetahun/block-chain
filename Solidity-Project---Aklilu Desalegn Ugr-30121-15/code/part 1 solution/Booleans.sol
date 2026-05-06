// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {
	bool public a = true;
    bool public b = false;
}


// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {
    int8 public a = 10;
    int8 public b = -15;
    int16 public difference = a - b;
    
}




// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {
    uint8 public a = 200;
    uint16 public b = 300;
    uint256 public sum = a + b;
    
}

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {
    bytes32 public msg1 = "Hello World";
     string public msg2 = "This is a longer Hello World message that exceeds thirty-two bytes!";
	
}

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {
 uint public x;
 constructor(uint _x){
     x = _x;
 }
     function increment() external {
        x = x + 1;
    }
}
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {
 uint public x;
 constructor(uint _x){
     x = _x;
 }
     function increment() external {
        x = x + 1;
    }
}
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {
 uint public x;
 constructor(uint _x){
     x = _x;
 }
     function increment() external {
        x = x + 1;
    }
        function add(uint y) external view returns (uint) {
        return x + y;
    }
}
// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import "forge-std/console.sol";

contract Contract {
    function winningNumber(string calldata secretMessage) external returns(uint) {
        console.log(secretMessage);
        return 794;
         
    }
}
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {
   function double(uint y) external pure returns (uint) {
        return y * 2;
    }
}




// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {
    function double(uint a) external pure returns (uint) {
        return a * 2;
    }

    function double(uint a, uint b) external pure returns (uint, uint) {
        return (a * 2, b * 2);
    }
}