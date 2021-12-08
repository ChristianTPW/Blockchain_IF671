const path = require("path");
const mnemonic = ""; //fill with secret key, purposely removed
const HDWalletProvider = require("@truffle/hdwallet-provider");

module.exports = {
  // See <http://truffleframework.com/docs/advanced/configuration>
  // to customize your Truffle configuration!
  contracts_build_directory: path.join(__dirname, "client/src/contracts"),
  networks: {
    develop: {
      port: 8545,
    },
    ropsten_infura: {
      provider: function () {
        return new HDWalletProvider(
          mnemonic,
          "https://ropsten.infura.io/v3/dd45b05eb96549c9b218d5e82d56fe70"
        );
      },
      network_id: 3,
    },
  },
  compilers: {
    solc: {
      version: "^0.6.0",
    },
  },
};
