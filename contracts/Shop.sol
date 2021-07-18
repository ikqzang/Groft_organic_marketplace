pragma solidity >=0.5.0;        
contract Shop{                          // สร้าง contract ขื่อ shop โดยใช้ contract ขื่อ Token จาก

    struct user {                       // 
        string fullname;                // อิคคิว
        string tel;                     // 080-928-380
        string location;                // sakjfpfap[]
        uint durian;                    // 00
        uint coconut;                   // 00
        uint pomelo;                    // 00
    }

    struct balance {                       
        uint amount;                  
    }

    mapping (address => balance) balanceMap;
    mapping (address => user) userMap;
    uint[] stock = [100,200,300]; // เก็บว่ามีผลไม้ในสต๊อกเท่าไร
    address owner = 0xD1FAaF20F63c679bB5A481bEb5352B0f1746FEC1;
    
    
    function setbalance(address _wallet,uint _value) public {
        balanceMap[_wallet].amount = _value;                
    }

    function getBalance() public view returns (uint){
        uint256 userbalance = balanceMap[msg.sender].amount;
        return (userbalance);   
    }

    function buyDurian(address _wallet,string memory _fullname,string memory _tel,string memory _location) public {
        balanceMap[_wallet].amount -= 30;
        balanceMap[owner].amount += 30;
        userMap[_wallet].fullname = _fullname;
        userMap[_wallet].tel = _tel;
        userMap[_wallet].location = _location;
        userMap[_wallet].durian += 1;
        stock[0] -= 1;
    }

    function buyCoconut(address _wallet,string memory _fullname,string memory _tel,string memory _location) public {
        balanceMap[_wallet].amount -= 10;
        balanceMap[owner].amount += 10;
        userMap[_wallet].fullname = _fullname;
        userMap[_wallet].tel = _tel;
        userMap[_wallet].location = _location;
        userMap[_wallet].coconut += 1;
        stock[1] -= 1;
    }

    function buypomelo(address _wallet,string memory _fullname,string memory _tel,string memory _location) public {
        balanceMap[_wallet].amount -= 10;
        balanceMap[owner].amount += 10;
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

    function setstock(uint _dstock,uint _cstock,uint _pstock) public  {
        stock[0] += _dstock;
        stock[1] += _cstock;
        stock[2] += _pstock;
    }
    
    
}
