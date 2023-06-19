pragma solidity ^0.8.0;

contract Cars {

    enum CarStatus { driving, parked }

    struct Car {
        bytes3 colour;
        uint8 doors;
        CarStatus status;
        address owner;
    }

    uint256 public numCars = 0;
    mapping(uint256 => Car) public cars;

    constructor() {
    }

    function addCar(
        bytes3 colour,
        uint8 doors
    )
        public
        returns(uint256 carId)
    {
        ___ = ++numCars;
        ___ memory newCar = ___(
            ___,
            ___,
            CarStatus.___,
            msg.___
        );
        _________ = newCar;
    }

}
