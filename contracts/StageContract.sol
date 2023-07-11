// SPDX-License-Identifier: MIT License
pragma solidity ^0.8.0;

contract StageContract {
    struct ExtraData {
        uint x;
        uint y;
        uint size_x;
        uint size_y;
        string _type;
    }

    struct Data {
        address addr;
        string name;
        uint entry;
        uint incentive;
        ExtraData[] extraDataArr;
    }

    uint[] public stageIds;
    mapping(uint => Data) public dataMap;
    mapping(address => uint[]) public accountStages;
    mapping(address => string[]) public accountNames;

    function setAllData(uint _stageID, address _addr, string memory _name, uint _entry, uint _incentive, ExtraData[] memory _extraDataArr) public {
        Data storage data = dataMap[_stageID];
        data.addr = _addr;
        data.name = _name;
        data.entry = _entry;
        data.incentive = _incentive;

        // Delete previous data
        delete data.extraDataArr;
        
        // Copy each element from memory to storage
        for (uint i = 0; i < _extraDataArr.length; i++) {
            data.extraDataArr.push(_extraDataArr[i]);
        }

        stageIds.push(_stageID);
        accountStages[_addr].push(_stageID);
        accountNames[_addr].push(_name);
    }

    function addExtraData(uint _stageID, uint _x, uint _y, uint _size_x, uint _size_y, string memory _type) public {
        ExtraData memory extraData = ExtraData({
            x: _x,
            y: _y,
            size_x: _size_x,
            size_y: _size_y,
            _type: _type
        });

        dataMap[_stageID].extraDataArr.push(extraData);
    }

    function get(uint _stageID) public view returns (address, string memory, uint, uint, ExtraData[] memory) {
        Data storage data = dataMap[_stageID];
        return (data.addr, data.name, data.entry, data.incentive, data.extraDataArr);
    }

    function getStageIds() public view returns (uint[] memory) {
        return stageIds;
    }

    function getAccountStages(address _addr) public view returns (uint[] memory) {
        return accountStages[_addr];
    }
    function getAccountNames(address _addr) public view returns (string[] memory) {
        return accountNames[_addr];
    }
}
