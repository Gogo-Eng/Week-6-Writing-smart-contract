// This setup uses Hardhat Ignition to manage smart contract deployments.
// Learn more about it at https://v2.hardhat.org/ignition

import { buildModule } from "@nomicfoundation/hardhat-ignition/modules";

const ERC20Module = buildModule("ERC20Module", (m) => {

  const erc20 = m.contract("ERC20", ["Gogo", "GG", 18], {
  });

  return { erc20 };
});

export default ERC20Module;
