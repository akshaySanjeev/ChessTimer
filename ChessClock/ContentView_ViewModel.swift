//
//  ContentView_ViewModel.swift
//  ChessClock
//
//  Created by Akshay T S on 02/08/24.
//

import Foundation

class PlayDetailModel: ObservableObject {
	@Published var moves: Int = 0
	@Published var totalTime: Int = 10
	@Published var timeRemaining: Float = 10
	var timeElapsed: Float = 0

	func updateMoves() {
		self.moves += 1
	}

	func reset() {
		self.moves = 0
		self.totalTime = 10
		self.timeRemaining = 10
		self.timeElapsed = 0
	}

	func updateTime(_ interval: Float) {
		self.timeElapsed += interval
		self.timeRemaining = Float(self.totalTime) - self.timeElapsed
	}
}

enum CurrentPlayer {
	case player1
	case player2

	mutating func switchPlayer() {
		switch self {
		case .player1:
			self = .player2
		case .player2:
			self = .player1
		}
	}
}

class ContentView_ViewModel: ObservableObject {

	var playerOneInfo = PlayDetailModel()
	var playerTwoInfo = PlayDetailModel()

	var matchStarted = false

	var currentPlayer = CurrentPlayer.player1

	var timer: Timer?

	func updateMoves() {
		switch currentPlayer {
		case .player1:
			self.playerOneInfo.updateMoves()
		case .player2:
			self.playerTwoInfo.updateMoves()
		}
	}

	func startTimer() {
		self.matchStarted = true
		self.timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
			switch self.currentPlayer {
			case .player1:
				self.playerOneInfo.updateTime(0.01)
			case .player2:
				self.playerTwoInfo.updateTime(0.01)
			}
		}
	}

	func switchTimer() {
		self.stopTimer()
		self.updateMoves()
		self.currentPlayer.switchPlayer()
		self.startTimer()
	}

	func stopTimer() {
		self.timer?.invalidate()
		self.timer = nil
	}
}

extension ContentView_ViewModel: GeneralControlsDelegate {
	func reset() {
		self.stopTimer()
		self.currentPlayer = .player1
		self.playerOneInfo.reset()
		self.playerTwoInfo.reset()
	}
}
