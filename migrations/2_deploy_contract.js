/* version https://cryptoast.fr/developper-smart-contract-solidity-react-truffle-drizzle/
*/
const Cina = artifacts.require("Cina");

module.exports = function(deployer) {
  deployer.deploy(Cina);
};


/*
seconde version type alyra:

// Import the smart contracts
const Voting = artifacts.require("Voting");

module.exports = (deployer) => {
    deployer.deploy(Voting);
}
*/