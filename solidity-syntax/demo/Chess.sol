//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import { IChessBoard, ChessBoard } from "./IChessBoard.sol";

contract Chess {

    IChessBoard public chessBoard;
    uint public jss;

    constructor () {
        chessBoard = new ChessBoard();
    }

    function getjss() 
        public 
    {
        jss = 10;
    }

}