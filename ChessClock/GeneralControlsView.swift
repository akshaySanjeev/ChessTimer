//
//  GeneralControlsView.swift
//  ChessClock
//
//  Created by Akshay T S on 02/08/24.
//

import SwiftUI

struct GeneralControlsView: View {
	
	@ObservedObject private var viewModel: GeneralControlsViewModel
	
	init(viewModel: GeneralControlsViewModel) {
		self.viewModel = viewModel
	}

    var body: some View {
		HStack {
			Image(systemName: "arrow.clockwise")
				.font(.system(size: 30, weight: .bold))
				.padding(EdgeInsets(top: -20, leading: 10, bottom: 0, trailing: 0))
				.contentShape(Rectangle())
				.onTapGesture {
					self.viewModel.reset()
				}
			Spacer()
			Image(systemName: "clock")
				.font(.system(size: 30, weight: .bold))
				.padding(EdgeInsets(top: -20, leading: 0, bottom: 0, trailing: 10))
				.contentShape(Rectangle())
				.onTapGesture {
				}
			Image(systemName: "speaker.wave.2")
				.font(.system(size: 30, weight: .bold))
				.padding(EdgeInsets(top: -20, leading: 0, bottom: 0, trailing: 10))
		}
    }
}

#Preview {
	GeneralControlsView(viewModel: GeneralControlsViewModel(delegate: ContentView_ViewModel()))
}
