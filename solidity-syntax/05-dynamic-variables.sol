pragma solidity ^0.8.0;

contract Cars {

    enum CarStatus { driving, parked }

    struct Car {
        bytes3 colour;
        uint8 doors;
        CarStatus status;
        address owner;
    }

    ___ public numCars = ___;
    ____(uint256 => ___) public cars;

    constructor() {
    }

}
