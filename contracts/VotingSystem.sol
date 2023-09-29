// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VotingSystemContract {

    address private owner;
    
    mapping(address => bool) private registeredVoters;
    mapping(string => uint256) private candidateVotes;

    event VoteCast(address indexed voter, string candidate);
    
    constructor() {
        owner = msg.sender;
    }
    
    // Modifier to check if the caller is the owner
    modifier onlyOwner() {
        require(msg.sender == owner, "Only the contract owner can perform this action");
        _;
    }
    
    // Modifier to check if the caller is a registered voter
    modifier onlyRegisteredVoter() {
        require(registeredVoters[msg.sender], "Only registered voters can perform this action");
        _;
    }
    
    // Function for the contract owner to register new voters
    function registerVoter(address _voterAddress) public onlyOwner {
        registeredVoters[_voterAddress] = true;
    }
    
    // Function to allow registered voters to cast their votes
    function castVote(string memory _candidate) public onlyRegisteredVoter {
        require(bytes(_candidate).length > 0, "Candidate name cannot be empty");
        candidateVotes[_candidate] += 1;
        emit VoteCast(msg.sender, _candidate);
    }
    
    // Function to retrieve the current vote count for a candidate
    function getVoteCount(string memory _candidate) public view returns (uint256) {
        return candidateVotes[_candidate];
    }
}
