//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;


interface IChessBoard {
    function sizeX() external returns(int);
    function sizeY() external returns(int);
    function posX() external returns(int);
    function posY() external returns(int);
    function totalMoves() external returns(int);

    
    function MoveX(int steps) external returns(int);
    function MoveY(int steps) external returns(int);
    function MoveXY(int stepsX, int stepsY) external returns(int, int);

    event HitTheTop(address, int);
    event HitTheRight(address, int);
}


contract ChessBoard is IChessBoard {
    int public sizeX;
    int public sizeY;
    int public posX;
    int public posY;
    int public totalMoves;

    constructor() {
        sizeX = 0;
        sizeY = 0;
        posX = 0;
        posY = 0;
        totalMoves = 0;
    }

    function MoveX(
        int steps
    )
        public
        ValidMove(steps, 0)
        HandleEvents
        returns(int) 
    {
        posX += steps;
        return posX;
    }

    function MoveY(
        int steps
    )
        public
        ValidMove(0, steps)
        HandleEvents
        returns(int) 
    {
        posY += steps;
        return posY;
    }

    function MoveXY(
        int stepsX,
        int stepsY 
    )
        public
        ValidMove(stepsX, stepsY)
        HandleEvents
        returns(int, int) 
    {
        posX += stepsX;
        posY += stepsY;
        return (posX, posY);
    }


    modifier ValidMove(
        int sx,
        int sy
    ) {
        require(posX + sx >= 0 && posX + sx < sizeX &&
            posY + sy >= 0 && posY + sy < sizeY,
            "Not a valid move");
        _;
    }

    modifier HandleEvents() {
        _;
        if(posX == sizeX - 1) {
            emit HitTheRight(msg.sender, totalMoves);
        }
        if(posY == sizeY - 1) {
            emit HitTheTop(msg.sender, totalMoves);
        }
    }
}