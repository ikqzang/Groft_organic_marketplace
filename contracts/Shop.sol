pragma solidity >=0.5.0;        
import "./token.sol";                   // นำ token.sol เข้ามาใช้

contract Shop is Token {                // สร้าง contract ขื่อ shop โดยใช้ contract ขื่อ Token จาก

    struct user {                       // 
        string fullname;                // อิคคิว
        string tel;                     // 080-928-380
        string location;                // sakjfpfap[]
        uint durian;                    // 00
        uint coconut;                   // 00
        uint pomelo;                    // 00
    } 
    

    mapping (address => user) userMap;
    uint[] stock = [100,200,300]; // เก็บว่ามีผลไม้ในสต๊อกเท่าไร
    address owner = 0xA832D93032aFD5aFC25638767C636cB35B3fBc9d;
    

    function buyDurian(address _wallet,string memory _fullname,string memory _tel,string memory _location) public {
        //transfer(owner , 30);
        userMap[_wallet].fullname = _fullname;
        userMap[_wallet].tel = _tel;
        userMap[_wallet].location = _location;
        userMap[_wallet].durian += 1;
        stock[0] -= 1;
    }

    function buyCoconut(address _wallet,string memory _fullname,string memory _tel,string memory _location) public {
        //transfer(owner , 2);
        userMap[_wallet].fullname = _fullname;
        userMap[_wallet].tel = _tel;
        userMap[_wallet].location = _location;
        userMap[_wallet].coconut += 1;
        stock[1] -= 1;
    }

    function buypomelo(address _wallet,string memory _fullname,string memory _tel,string memory _location) public {
        //transfer(owner , 2);
        userMap[_wallet].fullname = _fullname;
        userMap[_wallet].tel = _tel;
        userMap[_wallet].location = _location;
        userMap[_wallet].pomelo += 1;
        stock[2] -= 1;
    }

    function setuserzero(address _wallet) public {
        userMap[_wallet].durian = 0;
        userMap[_wallet].coconut = 0;
        userMap[_wallet].pomelo = 0;
    }

    function getdurianstock() public view returns (uint){            
        uint durianstock = stock[0];
        return (durianstock);                                                              
    }

    function getcoconutstock() public view returns (uint){            
        uint coconutstock = stock[1];
        return (coconutstock);                                                              
    }

    function getpomelostock() public view returns (uint){            
        uint pomelostock = stock[2];
        return (pomelostock);                                                              
    }

    function adddurianstock (uint newdstock) public  {
        stock[0] += newdstock;
    }

    function addcoconutstock (uint newdstock) public  {
        stock[1] += newdstock;
    }

    function addpomelostock (uint newdstock) public  {
        stock[2] += newdstock;
    }
    
    function getAddress() public view returns (address){
        address useraddress = msg.sender;
        return (useraddress);   
    }

    function getBalance() public view returns (uint256){
        uint256 userbalance = balanceOf[msg.sender];
        return (userbalance);   
    }
}
