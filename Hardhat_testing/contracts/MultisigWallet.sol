// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

contract MultiSig {
    uint8 sig_count;
    uint8 sig;
    uint signatory;
    address Owner;
    address[] signers;

    struct Transaction {
        address depositor_address;
    }
    
    Transaction[] public transactions;
    
    mapping(address => bool) public Confirmed;
    
    constructor(uint8 _sig, uint8 _signatory) {
        sig_count++;
        Owner = msg.sender;
        sig = _sig;
        signatory = _signatory;
        signers.push(Owner);

    }
    
    mapping(address => uint256) public EthBalances;
    
    modifier onlyOwner() {
        require(msg.sender == Owner, "not Owner");
        _;
    }
    function addSigners(address[] memory _address) public onlyOwner {
        for (uint256 i = 0; i < _address.length; i++) {
            signers.push(_address[i]);
        }
    }

    function IsValidSigner(address _address) public view returns (bool) {
        for (uint256 i = 0; i < signers.length; i++) {
            if (_address == signers[i]) {
                return true;
            }
        }
        return false;
    }
  
    function initiateDeposit() public{
        require(msg.sender != address(0), "Address Zero detected");

        Transaction memory transaction = Transaction({
            depositor_address: msg.sender
        });
        
        transactions.push(transaction);
    }
    
    function confirmSignatory() public returns(uint8){
        bool valid_signer = IsValidSigner(msg.sender);
        if (valid_signer == true) {
            sig_count++;
        }
        require(sig_count == sig, "Number of signatories not reached");
        Confirmed[msg.sender] = true;
        return sig_count;
    }
    function executeDepositETH() external payable {
        require(msg.sender != address(0), "Address zero detected");
        require(msg.value > 0, "Can't deposit zero value");
        
        initiateDeposit();
       
        confirmSignatory();

        EthBalances[msg.sender] = EthBalances[msg.sender] + msg.value;
    }
    function getSigners() public view returns(address[] memory) {
        return signers;
    }
    function number_sig() public view returns(uint8) {
        return sig_count;
    }
}