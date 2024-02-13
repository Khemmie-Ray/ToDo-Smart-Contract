// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract ToDo {
    struct List {
        string title;
        string description;
        bool isDone;
    }

    List[] public lists;

    function createList(string memory _title, string memory _description, bool _isDone) external {
        lists.push(List(_title, _description, _isDone));
    }

    function viewList() external view returns(List[] memory) {
        return lists;
    }

    function updateList(uint _index, string memory _updatedTitle, string memory _updatedDescription) external {
        require(_index < lists.length, "Index is incorrect");
        lists[_index].title = _updatedTitle;
        lists[_index].description = _updatedDescription;
    }

    function deleteTask(uint _index) external {
        require(_index < lists.length, "Index is incorrect");
        lists[_index] = lists[lists.length - 1];
        lists.pop();
    }

     function toggleStatus(uint _index) external {
        require(_index < lists.length, "Index is incorrect");
        if(lists[_index].isDone) {
            lists[_index].isDone = false;
        } else {
            lists[_index].isDone = true;
        }  
    }
}