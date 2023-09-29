
const hre = require("hardhat");

const { ethers } = require("ethers");

async function main() {
  const NODE_URL = "https://json-rpc.testnet.swisstronik.com";
  const provider = new ethers.JsonRpcProvider(NODE_URL);
  console.log(provider)

  const contractAddress = "0xecb0710e252D8CFecD9EA61b9c8fe687Fb551703";

  // Use provider.getStorageAt, not contract.getStorageAt
//   const storage = await provider.getStorageAt(contractAddress, 0);
//   console.log(storage);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});

