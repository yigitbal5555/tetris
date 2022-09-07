//
//  TetrisTests.swift
//  TetrisTests
//
//  Created by Pau Sabé Martínez on 6/9/22.
//

import XCTest
@testable import Tetris

class GameServiceTests: XCTestCase {
    
    var gameService: GameServiceProtocol! = nil
    var tetrominoServiceMock: TetrominoServiceMock! = nil
    
    override func setUp() {
        // TODO: mock Timer Service
        tetrominoServiceMock = TetrominoServiceMock()
        gameService = GameService(tetrominoService: tetrominoServiceMock)
    }
    
    func testStartGame() throws {
        startGame()
    }
    
    func startGame(randomTetromino: Int? = nil) {
        XCTAssertEqual(gameService.currentState, GameState.stopped)
        XCTAssertNil(gameService.currentTetromino)
        
        tetrominoServiceMock.randomTetromino = randomTetromino
        gameService!.play()
        
        XCTAssertNotNil(gameService.currentTetromino)
        XCTAssertEqual(gameService.currentState, GameState.running)
    }

    func testOneHorizontalMovementStraight() throws {
        startGame(randomTetromino: 1)
        checkMovement()
    }
    
    func testOneHorizontalMovementSquare() throws {
        startGame(randomTetromino: 2)
        checkMovement()
    }
    
    func testOneHorizontalMovementT() throws {
        startGame(randomTetromino: 3)
        checkMovement()
    }
    
    func testOneHorizontalMovementL() throws {
        startGame(randomTetromino: 4)
        checkMovement()
    }
    
    func testOneHorizontalMovementSkew() throws {
        startGame(randomTetromino: 5)
        checkMovement()
    }
    
    func checkMovement(){
        let startingTetrominoColumn = gameService.currentTetromino!.firstSquare.boardColumn
        XCTAssertTrue(gameService!.moveLeft())
        let movedTetrominoColumn = gameService.currentTetromino!.firstSquare.boardColumn
        XCTAssertEqual(startingTetrominoColumn, movedTetrominoColumn + 1)
    }
    
    func testTimerTickMakesTetrominoGoDown() throws{
        
    }

}
