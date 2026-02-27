// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract MultiSig {
    uint8 sig_count
    uint8 sig;
    uint signatory;
    address Owner;
    address[] signers;

    struct Transaction {
        uint16 id;
        bool isConfirmed;
    }
    constructor(uint8 _sig, uint8 _signatory) {
        Owner = msg.sender;
        sig = _sig;
        signatory = _signatory;
        signers.push(Owner);

    }
    
    mapping(address => uint256) public EthBalances;
    mapping()
    modifier onlyOwner() {
        require(msg.sender == Owner, "not Owner");
        _;
    }
    function addSigners(address[] memory _address) external onlyOwner returns(address[]) {
        signers.push(_address);
        return signers;
    }

    function IsValidSigner(address _address) {
        for (uint256 i = 0; i < addSigners().length; i++) {
            if ()
        }
    }
    struct DepositTransaction {


    }

    function deposit() external payable{
        require(msg.sender != address(0), "Address Zero detected");
        if 
        sig_count++ //sig++;

        require(sig == )
    }
    

    // function IsSigner() public view returns (bool) {
    //     for(uint i = 0; i < signers.length; i++) {
    //         if(msg.sender == signers[i]) {
    //             return true;
    //         }
    
 
    function depositETH() external payable {
        require(msg.sender != address(0), "Address zero detected");
        require(msg.value > 0, "Can't deposit zero value");

        EthBalances[msg.sender] = EthBalances[msg.sender] + msg.value;
    }
}