pragma solidity ^0.5.0;

contract TodoList{
    uint public taskCount = 0;


    //TodoList tasks
    struct Task {
        uint id;
        string content;
        bool completed;

    }

    //Mapping Task into a different data type
    mapping(uint => Task) public tasks;

    event TaskCreated(
        uint id,
        string content,
        bool completed
    );

    event TaskCompleted(
        uint id,
        bool completed
    );

    constructor() public{
        createTask("Check this out");
    }
    
    //Put task struct into mapping
    function createTask(string memory _content) public {
        //increment task value everytime we add a task
        taskCount++;
        tasks[taskCount] = Task(taskCount, _content, false);
        emit TaskCreated(taskCount, _content, false);

        
    }

    function toggleCompleted(uint _id) public {
        Task memory _task = tasks[_id];
        _task.completed = !_task.completed;
        tasks[_id] = _task;
        emit TaskCompleted(_id, _task.completed);

    }


 }
