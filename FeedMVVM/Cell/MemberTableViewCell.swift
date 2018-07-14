//
//  MemberTableViewCell.swift
//  FeedMVVM
//
//  Created by youhsuan on 2018/7/13.
//  Copyright © 2018年 youhsuan. All rights reserved.
//

import UIKit

class MemberTableViewCell: UITableViewCell, CellConfiguration {

    @IBOutlet weak var profileImgView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addButton: UIButton!
    
    func setup(viewModel: DataViewModel){
        guard let viewModel = viewModel as? MemberViewModel else { return }
        self.nameLabel.text = viewModel.name
        self.profileImgView.image = viewModel.image
        self.addButton.isHidden = isSelected
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
