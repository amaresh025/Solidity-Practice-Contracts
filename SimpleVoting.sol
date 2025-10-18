// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract SimpleVoting {
    address owner;

    constructor() {
        owner = msg.sender;
    }

    mapping(address => bool) public hasVoted;
    mapping(address => bool) public hasRegistered;
    mapping(string => uint) public votesReceived;

    string[] private candidateslist;

    address[] private votersList;

    modifier Require() {
        require(msg.sender == owner, "Not owner");
        _;
    }
    event TrackVoters(address indexed _voters, string _candidates);

    function addCandidates(string memory name) public Require {
        candidateslist.push(name);
    }

    function getCandidates() public view returns (string[] memory) {
        return candidateslist;
    }

    function registerVoters(address voters) public Require {
        votersList.push(voters);
        hasRegistered[voters] = true;
    }

    function getVoters() public view returns (address[] memory) {
        return votersList;
    }

    function vote(string memory name) public {
        require(!votingClosed, "Voting is already closed!");
        require(hasRegistered[msg.sender] == true, "Not Ragistered!");
        require(hasVoted[msg.sender] == false, "already voted!");

        votesReceived[name] += 1;
        hasVoted[msg.sender] = true;

        emit TrackVoters(msg.sender, name);
    }

    bool public votingClosed;

    function endVoting() public Require {
        votingClosed = true;
    }

    function getWinner()
        public
        view
        returns (string memory winnerName, uint winnerVotes)
    {
        uint highestVotes = 0;
        for (uint i = 0; i < candidateslist.length; i++) {
            string memory candidate = candidateslist[i];
            uint votes = votesReceived[candidate];
            if (votes > highestVotes) {
                highestVotes = votes;
                winnerName = candidate;
                winnerVotes = votes;
            }
        }
    }

    function resetVoting() public Require {
        delete candidateslist;
        delete votersList;
        votingClosed = false;
    }
}
