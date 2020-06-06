//
//  MobileDataTableViewCell.swift
//  SPHSampleTest
//
//  Created by Chandresh on 6/6/20.
//  Copyright © 2020 Chandresh. All rights reserved.
//

import UIKit

class MobileDataTableViewCell: BaseTableViewCell {
    @IBOutlet weak var lblYear: UILabel!
    @IBOutlet weak var lblYearDescription: UILabel!
    @IBOutlet weak var lblVolume: UILabel!
    @IBOutlet weak var lblVolumeDescription: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    func ConfigureCellWithData(data: MobileDataViewModel) {
        
    }
}

