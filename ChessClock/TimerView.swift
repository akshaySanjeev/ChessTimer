//
//  TimerView.swift
//  ChessClock
//
//  Created by Akshay T S on 02/08/24.
//

import SwiftUI

struct TimerView: View {

	@ObservedObject private var viewModel: PlayDetailModel

	init(viewModel: PlayDetailModel) {
		self.viewModel = viewModel
	}

    var body: some View {
		VStack {
			Text("Moves \(self.viewModel.moves)")
				.font(.system(size: 15, weight: .semibold))
				.frame(maxWidth: .infinity, alignment: .trailing)
				.padding(.trailing, 20)
				.foregroundStyle(.gray)
			Spacer()
			Text(String(format: "%.2f", self.viewModel.timeRemaining))
				.font(.system(size: 100, weight: .bold))
			VStack {
				Image(systemName: "slider.horizontal.3")
					.font(.system(size: 20, weight: .bold))
					.padding(EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 0))
				Text("\(self.viewModel.totalTime) min")
					.font(.system(size: 15, weight: .bold))
			}
			.contentShape(Rectangle())
			.onTapGesture {
				print("Text")
			}
		}
    }
}

#Preview {
	TimerView(viewModel: PlayDetailModel())
}

