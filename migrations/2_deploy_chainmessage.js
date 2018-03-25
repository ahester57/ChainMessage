var ChainMessage = artifacts.require("ChainMessage");

module.exports = function(deployer) {
  deployer.deploy(ChainMessage, "hi");
};
