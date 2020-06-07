//
//  MobileDataTableViewCell.swift
//  SPHSampleTest
//
//  Created by Chandresh on 6/6/20.
//  Copyright © 2020 Chandresh. All rights reserved.
//

import UIKit
protocol MobileDataTableViewCellDelegate: class {
    func showPopUpWithMessage()
}
class MobileDataTableViewCell: BaseTableViewCell {
    @IBOutlet weak var lblYear: UILabel!
    @IBOutlet weak var lblYearDescription: UILabel!
    @IBOutlet weak var lblVolume: UILabel!
    @IBOutlet weak var lblVolumeDescription: UILabel!
    @IBOutlet weak var viewBg: UIView!
    @IBOutlet weak var increaseDecreaseVolume: UIButton! {
        didSet {
            increaseDecreaseVolume.isHidden = true
        }
    }
    weak var delegate: MobileDataTableViewCellDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
        viewBg.backgroundColor = .cyan
        viewBg.layer.cornerRadius = 10
        // Initialization code
    }
    func ConfigureCellWithData(data: MobileDataViewModel) {
        lblYear.text = "Year: "
        lblYearDescription.text = data.quarter
        lblVolume.text = "Volume: "
        lblVolumeDescription.text = data.volume
        if data.volumeDataDecrease == true {
            increaseDecreaseVolume.isHidden = false
        }
    }
    @IBAction func clickOnButtonEvent(_ sender: Any) {
        delegate?.showPopUpWithMessage()
    }

}

