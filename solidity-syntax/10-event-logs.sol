pragma solidity ^0.8.0;

contract Cars {

    enum CarStatus { driving, parked }

    ___ CarHonk(_________);

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
        payable
        returns(uint256 carId)
    {
        require(
            msg.value > 0.1 ether,
            "requires payment"
        );
        carId = ++numCars;
        Car memory newCar = Car(
            colour,
            doors,
            CarStatus.parked,
            msg.sender
        );
        cars[carId] = newCar;
    }

    function statusChange(
        uint256 carId,
        CarStatus newStatus
    )
        public
        onlyOwner(carId)
    {
        require(
            cars[carId].status != newStatus,
            "no change"
        );
        cars[carId].status = newStatus;
    }

    function honk(
        uint256 carId
    )
        public
        _________
    {
        ___ CarHonk(___);
    }

    modifier onlyOwner(
        uint256 carId
    )
    {
        require(
            cars[carId].owner == msg.sender,
            "only owner"
        );
        _;
    }

}
