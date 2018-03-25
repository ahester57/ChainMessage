pragma solidity ^0.4.0;


/// @title Chain Message
contract ChainMessage {
    /*
    * @title Chain Message
    * @author Austin Hester
    * @dev This line is for developers only
    */

    mapping (address => string) public message;

    function ChainMessage(string init) public {
        message[msg.sender] = init;
        //assert(strcmp(init, message[msg.sender]));
    }

    function sendMessage(
        address _to,
        string _msg
    ) public {
        require(_to != 0x0);
        message[_to] = _msg;
        //assert(strcmp(_msg, message[msg.sender]));
    }

    function getMessage(
        address _of
    ) public view returns (string _msg) {
        require(_of != 0x0);
        string memory s = message[_of];
        return s;
    }

    function clearMessage(
        address _of
    ) public {
        require(_of == msg.sender);
        message[msg.sender] = "";
    }

    function strcmp(
        string a,
        string b
    ) public pure returns (bool) {
        return (keccak256(a) == keccak256(b));
    }

}