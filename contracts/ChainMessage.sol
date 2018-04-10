pragma solidity ^0.4.0;


/// @title Chain Message
contract ChainMessage {
    /*
    * @title Chain Message
    * @author Austin Hester
    * @dev This line is for developers only
    */

    mapping (address => string) public message;

    event SentMessage(
		address indexed _from,
		address indexed _to,
		string _msg
	);

    function ChainMessage(string init) public {
        message[msg.sender] = init;
    }

    function sendMessage(
        address _to,
        string _msg
    ) public {
        require(_to != 0x0);
        message[_to] = _msg;
        SentMessage(msg.sender, _to, _msg);
        //assert(strcmp(_msg, message[_to]));
    }

    function getMessage(
        address _of
    ) public view returns (string _msg) {
        require(_of != 0x0);
        //require(_of == msg.sender);
        string memory s = message[_of];
        return s;
    }

    function clearMessage(
        address _of
    ) public {
        require(_of != 0x0);
        require(_of == msg.sender);
        message[msg.sender] = "";
        assert(strcmp("", message[msg.sender]));
    }

    function strcmp(
        string a,
        string b
    ) public pure returns (bool) {
        return (keccak256(a) == keccak256(b));
    }

}
