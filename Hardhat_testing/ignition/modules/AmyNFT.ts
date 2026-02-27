// This setup uses Hardhat Ignition to manage smart contract deployments.
// Learn more about it at https://v2.hardhat.org/ignition

import { buildModule } from "@nomicfoundation/hardhat-ignition/modules";

const AmyNFTModule = buildModule("StorageModule", (m) => {
  const amynft = m.contract("AmyNFT");

  return { amynft };
});

export default AmyNFTModule; 