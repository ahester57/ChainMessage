var ChainMessage = artifacts.require("ChainMessage");

contract('ChainMessage', function(accounts) {
    var instance;
    ChainMessage.deployed().then(function(inst) {
        instance = inst;
    });
    it("should give creator a message", function() {
        return instance.getMessage.call(accounts[0]).then(function(message) {
            //console.log(message);
            assert.equal(message, "hi", "shitititititititi");
        });
    });
    it("should send bye to accounts[1]", function() {
        return instance.sendMessage(accounts[1], "bye", {from: accounts[0]}).then(function() {
            return instance.getMessage.call(accounts[1]).then(function(message) {
                //console.log(message);
                assert.equal(message, "bye", "no good");
            });
        });
    });
    it("should clear message of accounts[0]", function() {
        return instance.clearMessage(accounts[0], {from: accounts[0]}).then(function() {
            return instance.getMessage.call(accounts[0]).then(function(message) {
                //console.log(message);
                assert.equal(message, "", "no good");
            });
        });
    });
});