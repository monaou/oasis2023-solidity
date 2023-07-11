require("@nomiclabs/hardhat-waffle");

// Create secrets.json file with private key and remove comment out
//const { PRIVATE_KEY } = require('./secrets.json');

// This is a sample Hardhat task. To learn how to create your own go to
// https://hardhat.org/guides/create-task.html
task("accounts", "Prints the list of accounts", async (taskArgs, hre) => {
  const accounts = await hre.ethers.getSigners();

  for (const account of accounts) {
    console.log(account.address);
  }
});

// You need to export an object to set up your config
// Go to https://hardhat.org/config/ to learn more

/**
 * @type import('hardhat/config').HardhatUserConfig
 */
module.exports = {
  solidity: "0.8.4",
  defaultNetwork: "hardhat",
  networks: {
    hardhat: {
    },
    hmvtest: {
      url: 'https://rpc.sandverse.oasys.games',
      chainId: 20197,
      gasPrice: 0,
      accounts: [
        '0xa267530f49f8280200edf313ee7af6b827f2a8bce2897751d06a843f644967b1'
        // Provide your private key here
        // Remove comment out to use value from secrets.json
        //PRIVATE_KEY
      ],
    },
  },
};
