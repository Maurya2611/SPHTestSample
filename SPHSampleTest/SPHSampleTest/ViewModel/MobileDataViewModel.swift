//
//  MobileDataViewModel.swift
//  SPHSampleTest
//
//  Created by Chandresh on 6/6/20.
//  Copyright © 2020 Chandresh. All rights reserved.
//

import Foundation
class MobileDataViewModel : Equatable {
    var volume: String = ""
    var quarter: String = ""
    var year: String = ""
    var id: Int = 0
    var volumeDataDecrease: Bool = false
}

func ==(lhs: MobileDataViewModel, rhs: MobileDataViewModel) -> Bool {
    return (lhs.volume == rhs.volume || lhs.quarter == rhs.quarter || lhs.year == rhs.year ||  lhs.id == rhs.id || lhs.volumeDataDecrease == rhs.volumeDataDecrease)
}
