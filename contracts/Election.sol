pragma solidity ^0.5.0;



contract Election {
// Model a Candidate
struct Candidate {
uint id;
string name;
uint voteCount;
}



// Store accounts that have voted
mapping(address => bool) public voters;






// Read/write Candidates
mapping(uint => Candidate) public candidates;



// Store Candidates Count
uint public candidatesCount;



function addCandidate (string memory _name) public {
require(msg.sender == 0x93CD130caFaa8Df3879CE94B02F09aC90c390B4A || msg.sender == 0x2e2DA769C5158213371063248168FbD7D860eE9A );
candidatesCount ++;
candidates[candidatesCount] = Candidate(candidatesCount, _name, 0);

}


event votedEvent (
uint indexed _candidateId
);



function vote (uint _candidateId) public {
// require that they haven't voted before
require(!voters[msg.sender] );

// require a valid candidate
require(_candidateId > 0 && _candidateId <= candidatesCount);
// record that voter has voted
voters[msg.sender] = true;
// update candidate vote Count
candidates[_candidateId].voteCount ++;



// trigger voted event
emit votedEvent(_candidateId);
}

constructor() public {
addCandidate("Candidate 1");
addCandidate("Candidate 2");

}
}