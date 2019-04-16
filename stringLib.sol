pragma solidity >=0.4.15 <0.6.0;

library stringLib {
    // Working with strings and bytes
    function concatenate(string memory firstName, string memory lastName) internal pure returns (string memory fullName) {
    uint len1=bytes(firstName).length;
    uint len2=bytes(lastName).length;
    uint lc=len1+len2+1;
    bytes memory fullString= new bytes(lc);
    for(uint8 i= 0; i<len1; i++){
        fullString[i]= bytes(firstName)[i];
    }
    for(uint8 j= 0;j<len2;j++){
        fullString[len1+j]= bytes(lastName)[j];
    }
    return (string(fullString));
    }
}
