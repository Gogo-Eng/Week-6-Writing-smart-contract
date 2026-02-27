import {
  time,
  loadFixture,
} from "@nomicfoundation/hardhat-toolbox/network-helpers";
import { expect } from "chai";
import hre from "hardhat";

describe("ERC20", function() {
   async function deployERC20() {
        const [owner, address1, address2] = await hre.ethers.getSigners();
        const ERC20 = await hre.ethers.getContractFactory("ERC20");
        
        const erc20 = await ERC20.deploy("Gogo", "GG", 18);

        return { erc20, owner, address1, address2}
   };

   async function deploySaveAsset() {
        const [owner, address1, address2] = await hre.ethers.getSigners();
        const ERC20 = await hre.ethers.getContractFactory("ERC20");
        
        const SaveAsset = await hre.ethers.getContractFactory("SaveAsset");
        const erc20 = await ERC20.deploy("Gogo", "GG", 18);
        
        const erc20Address = await erc20.getAddress();
        const saveasset = await SaveAsset.deploy(erc20Address) as any;

        return { erc20, saveasset, owner, address1, address2}
   }

    it ("Should have the correct meta data", async function () {
        const result = await loadFixture(deployERC20);
        expect(await result.erc20.name()).to.equal("Gogo");
        expect(await result.erc20.symbol()).to.equal("GG");
        expect(await result.erc20.decimals()).to.equal(18);
    });

    it ("Should Deposite Ether", async function () {
        const {erc20, saveasset, owner, address1, address2} = await loadFixture(deploySaveAsset);
        const saveassetAddress = await saveasset.getAddress();
        
        await erc20.mint(address1.address, 1000);
        await erc20.connect(address1).approve(saveassetAddress, 500);
        
        await erc20.mint(address2.address, 1000);
        await erc20.connect(address2).approve(saveassetAddress, 500);
        
        await saveasset.connect(address1).depositETH({value: hre.ethers.parseEther("50")});
        expect(await saveasset.EthBalances(address1.address)).to.equal(hre.ethers.parseEther("50"));
        await expect(saveasset.connect(address2).depositETH({value: hre.ethers.parseEther("0")})).to.be.revertedWith("Can't deposit zero value");

        const balance1 = await hre.ethers.provider.getBalance(saveassetAddress);
        expect(balance1).to.equal(50000000000000000000n);
    
    });

    it ("Should Withdraw Ether", async function () {
        const {erc20, saveasset, address1} = await loadFixture(deploySaveAsset);
        
        const saveassetAddress = await saveasset.getAddress();
        const OldBalance = await hre.ethers.provider.getBalance(address1.address);
        console.log(OldBalance);
        await saveasset.connect(address1).depositETH({value: hre.ethers.parseEther("50")});
        const ContractBalance = await hre.ethers.provider.getBalance(saveassetAddress);
        console.log(ContractBalance)
        await saveasset.connect(address1).withdrawETH(hre.ethers.parseEther("50"));
        const NewBalance = await hre.ethers.provider.getBalance(address1.address);
        console.log(NewBalance);
        const balance = NewBalance - OldBalance;

        expect(balance).to.be.closeTo(hre.ethers.parseEther("0"),hre.ethers.parseEther("1"));
    })

});
