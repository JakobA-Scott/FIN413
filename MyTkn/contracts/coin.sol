contract Coin {
    address public minter; 
    // "mapping" creates "balances" as state variable
    // "public" makes variables accessible from other contracts
    mapping(address => uint256) public balances; //'' table called balance, first column is adress other column is Uint like 0x123 has balance 9 and so on

//"every adress has a value"


    // constructor (optional) is only run when the contract is created
    //"message sender is whoever sends the message. 
    constructor() public {
        minter = msg.sender;
    }
    // "
    function mint(address receiver, uint256 amount) public {
        require(msg.sender == minter);
        //" is the sender the minter? then continue
        require(amount < 1e60);
        //" a+=b ==> a = a+b;
        balances[receiver] += amount; //"uppdate the balance table"
    }
    //" checikng if the sender has the money and then subtracting it from the sender"
    function send(address receiver, uint256 amount) public {
        require(amount <= balances[msg.sender]);
        balances[msg.sender] -= amount;
        balances[receiver] += amount;
    }
}
