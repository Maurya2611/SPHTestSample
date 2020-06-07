//
//  MobileDataPresenter.swift
//  SPHSampleTest
//
//  Created by Chandresh on 7/6/20.
//  Copyright © 2020 Chandresh. All rights reserved.
//

import Foundation
import UIKit

protocol MobileDataPresenterLogic: class {
    func presentMobileData(response: [MobileDataViewModel])
}

class MobileDataPresenter: MobileDataPresenterLogic {
    weak var viewController: MobileDataProtocol?
    // MARK: Do something
    func presentMobileData(response: [MobileDataViewModel]) {
        viewController?.displayMobileData(viewModel: response)
    }
}
