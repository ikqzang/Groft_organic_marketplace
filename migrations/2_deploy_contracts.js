var Contracts = artifacts.require("./Shop.sol");

module.exports = function(deployer) {
  deployer.deploy(Contracts);
};