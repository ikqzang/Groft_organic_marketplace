pragma solidity >=0.5.0;

contract Token {
    mapping (address => uint) public balanceOf;

    constructor() public {
        balanceOf[msg.sender] = 10000;         // [(0x1,10000),(0x2,0),(0x3,0),(0x4,0),(0x5,0)]
    }

    function transfer(address _to, uint _value) public returns (bool success) {
        require(balanceOf[msg.sender] >= _value);                // Check if the sender has enough
        require(balanceOf[_to] + _value >= balanceOf[_to]);     // Check for overflows
        //-----------------start------------
        balanceOf[msg.sender] -= _value;                // ลดเงินในบัญชี ผู้โอน ตาม _value(มูลค่า) 
        balanceOf[_to] += _value;                       // เพิ่มเงินในบัญชี ผู้รับ ตาม _value(มูลค่า)
         //-----------------end------------
        return true;
    }

}