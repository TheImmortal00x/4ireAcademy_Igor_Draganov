const IDToken = artifacts.require("IDToken");

module.exports = function (deployer) {
  deployer.deploy(IDToken);
};
