//
//  ContentView.swift
//  ChessClock
//
//  Created by Akshay T S on 02/08/24.
//

import SwiftUI

struct ContentView: View {

	var playerOneView: TimerView
	var playerTwoView: TimerView
	var generalControls: GeneralControlsView

	@ObservedObject private var viewModel: ContentView_ViewModel

	init(viewModel: ContentView_ViewModel = ContentView_ViewModel()) {
		self.viewModel = viewModel
		self.playerOneView = TimerView(viewModel: viewModel.playerOneInfo)
		self.playerTwoView = TimerView(viewModel: viewModel.playerTwoInfo)
		self.generalControls = GeneralControlsView(viewModel: GeneralControlsViewModel(delegate: viewModel))
	}

	var body: some View {
		VStack{
			self.playerTwoView
				.padding([.top, .bottom], 10)
				.rotationEffect(.degrees(180))
				.contentShape(Rectangle())
				.onTapGesture {
					if !self.viewModel.matchStarted {
						self.viewModel.startTimer()
					} else if self.viewModel.currentPlayer == .player2 {
						self.viewModel.switchTimer()
					}
				}
			ZStack {
				Rectangle()
					  .fill(.gray)
					  .frame(height: 60)
				self.generalControls
				.padding(EdgeInsets(top: 30, leading: 10, bottom: 10, trailing: 10))
				.foregroundColor(.white)
			}
			self.playerOneView
			.padding(.top, 10)
			.contentShape(Rectangle())
			.onTapGesture {
				if self.viewModel.matchStarted, self.viewModel.currentPlayer == .player1 {
					self.viewModel.switchTimer()
				}
			}
		}
    }
}

#Preview {
	ContentView()
}
