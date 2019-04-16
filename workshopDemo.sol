pragma solidity >=0.4.0 <0.6.0;

import './stringLib.sol';

// Workshop contract
contract workshopDemo {
    uint number1;
    uint number2;
    address private owner;
    uint[] listOfNumbers;

    using stringLib for string;     // For using string related functions in the library
    
    // Student information structure
	struct Student {
        string firstname;
        string lastName;
        uint marks;
        uint rollNumber;
    }
	
	// mapping for student struct
    mapping(uint => Student) studentList;
    // Array of struct Student
    Student[] students;
	
	// Added event
	event addStudentEvent(string first_name, string last_name, uint student_marks);
    
    // Set some values in the constuctor
    constructor () public {
        owner = msg.sender;
        number1 = 0;
        number2 = 0;
    }
    
    // Return the address of account that deployed the contract
    function getOwnerAddress() public view returns (address) {
        return owner;
    }
    
    // now return contract address
    function getContractAddress() public view returns (address) {
        return address(this);
    }
    
    // pure function
    function sum (uint num1, uint num2) public pure returns (uint) {  
        return num1 + num2; 
    }
    
    // this is a transaction
    function setNumberValues(uint num1, uint num2) external {
        number1 = num1;
        number2 = num2;
    } 
    
    // this is a call
    function getNumberValues() public view returns (uint, uint) {
        return (number1, number2);
    }
	
	//Operations on Array
	
	function savelistofNumbers (uint sampleNum) public {
        listOfNumbers.push(sampleNum);
    }
    
    // Sum up numbers in an array
	function bulkSumNumbers() public view returns (uint) {
        uint result =0;
        for( uint i =0 ; i < listOfNumbers.length;i++) {
            result += listOfNumbers[i];
        }
        return result;
    }
    
    function getArray() public view returns(uint[] memory) {
        return listOfNumbers;
    }

	// Working with strings and bytes
    function concatenateStrings(string memory firstName, string memory lastName) public pure returns (string memory fullName) {
    return firstName.concatenate(lastName);
    }
    
	// Struct operations
    // Add student details
    function addStudentDetail(uint roll, string memory fName, string memory lName, uint marks ) public {
        Student memory record = Student({
        firstname: fName,
        lastName: lName,
        marks: marks,
        rollNumber: roll
        });
       studentList[roll] = record;
       students.push(record);
       emit addStudentEvent(fName, lName, marks); // emit event on creation of new student record
    }
    
    // Return student details
    function getStudentDetail(uint roll) public view returns (string memory fName, string memory lName, uint marks) {
     uint counter = 0;
     do{
        if (students[counter].rollNumber == roll) {
            return (students[counter].firstname, students[counter].lastName, students[counter].marks);
        }
        counter++;
     } while(counter < students.length);
     return('Record does not exist', 'Record does not exist', 0);
    }
    
    // Return details from the mapping
    function getStudentDetailMap(uint roll) public view returns (string memory fName, string memory lName, uint marks) {     
     return (studentList[roll].firstname, studentList[roll].lastName, studentList[roll].marks);
    }
}
