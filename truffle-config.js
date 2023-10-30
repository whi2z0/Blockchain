const HDWalletProvider = require('@truffle/hdwallet-provider');
module.exports = {
  networks: {
    sepolia: {
      provider: () => new HDWalletProvider("garage kite recall umbrella six tape pledge hammer work snake tank steak", `https://eth-sepolia.g.alchemy.com/v2/c9yG-87hKjW1BE02Mlz44RWiuQqyw6y5`),
      network_id: 11155111
    },
    mocha: {},
    compilers: {
      solc: {
        version: "0.8.21"
      }
    }
  }
};
