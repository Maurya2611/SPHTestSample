//
//  BaseTableViewCell.swift
//  SPHSampleTest
//
//  Created by Chandresh on 6/6/20.
//  Copyright © 2020 Chandresh. All rights reserved.
//

import Foundation
import UIKit
class BaseTableViewCell: UITableViewCell {
    public static var reuseIdentifier: String {
        return String(describing: self)
    }
    public static var nib: UINib {
        return UINib(nibName: self.reuseIdentifier, bundle: Bundle(for: self))
    }
}
