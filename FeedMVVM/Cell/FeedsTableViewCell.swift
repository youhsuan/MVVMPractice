//
//  FeedsTableViewCell.swift
//  FeedMVVM
//
//  Created by youhsuan on 2018/7/13.
//  Copyright © 2018年 youhsuan. All rights reserved.
//

import UIKit

class FeedsTableViewCell: UITableViewCell, CellConfiguration {
    
    @IBOutlet weak var photoView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    
    func setup(viewModel: DataViewModel) {
        guard let viewModel = viewModel as? PhotoViewModel else { return }
        self.photoView.image = viewModel.photoImg
        self.titleLabel.text = viewModel.title
        self.contentLabel.text = viewModel.content
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
