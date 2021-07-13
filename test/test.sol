pragma solidity >=0.5.0;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/Shop.sol";

contract TestShop {
  Shop deshop = Shop(DeployedAddresses.Shop());
    uint expecteddurianstock = 100;
    uint expectedcoconutstock = 200; 
    uint expectedpomelostock = 300; 
    address user = 0xB167937e28C5B3D68D9f5Ab9F160A70FaCf3c5F9;
    string name = 'prayut chanocha';
    string tel = '0888888888';
    string location = 'hell';
    
    
  function testgetdata() public {
    uint returndurianstock = deshop.getdurianstock();
    uint returncoconutstock = deshop.getcoconutstock(); 
    uint returnpomelostock = deshop.getpomelostock(); 
    Assert.equal(returndurianstock, expecteddurianstock, "buyLotteryByID of the expected result should match what is returned.");  
    Assert.equal(returncoconutstock, expectedcoconutstock, "getBookingById of the expected WdBalance should match what is returned.");
    Assert.equal(returnpomelostock, expectedpomelostock, "getBookingById of the expected LockBalance should match what is returned.");
  } 

  function testaddstock() public {
    deshop.adddurianstock(2);
    uint returndurianstock = deshop.getdurianstock();
    Assert.equal(returndurianstock, expecteddurianstock+2, "buyLotteryByID of the expected result should match what is returned.");  
    } 

  function testbuyDurian() public {
    deshop.buyDurian(user,name,tel,location);
    uint returndurianstock = deshop.getdurianstock();
    Assert.equal(returndurianstock, expecteddurianstock+1, "buyLotteryByID of the expected result should match what is returned.");  
    } 

  function testbuyCoconut() public {
    deshop.buyCoconut(user,name,tel,location);
    uint returncoconutstock = deshop.getcoconutstock(); 
    Assert.equal(returncoconutstock, expectedcoconutstock-1, "buyLotteryByID of the expected result should match what is returned.");  
    } 

  function testbuypomelo() public {
    deshop.buypomelo(user,name,tel,location);
    uint returnpomelostock = deshop.getpomelostock(); 
    Assert.equal(returnpomelostock, expectedpomelostock-1, "buyLotteryByID of the expected result should match what is returned.");  
    } 



}