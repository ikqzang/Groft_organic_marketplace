
const Token = artifacts.require('Token');
const Shop = artifacts.require('Shop');

module.exports = function(deployer, networks, accounts) {
  deployer
    .deploy(Token)
    .then(async () => {
      const tokenContract = await Token.deployed();
      return deployer.deploy(Shop, tokenContract.address);
    })
    .then(async () => {
      const token = await Token.deployed();
      const value = 500;
      await token.transfer(accounts[1], value);
    });
};
