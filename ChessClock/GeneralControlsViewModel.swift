//
//  GeneralControlsViewModel.swift
//  ChessClock
//
//  Created by Akshay T S on 02/08/24.
//

import Foundation

protocol GeneralControlsDelegate: AnyObject {
	func reset()
}

class GeneralControlsViewModel: ObservableObject {
	
	weak var delegate: GeneralControlsDelegate?

	init(delegate: GeneralControlsDelegate) {
		self.delegate = delegate
	}

	func reset() {
		self.delegate?.reset()
	}
}
