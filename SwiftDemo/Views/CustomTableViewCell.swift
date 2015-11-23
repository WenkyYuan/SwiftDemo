//
//  CustomTableViewCell.swift
//  SwiftDemo
//
//  Created by wenky on 15/11/23.
//  Copyright © 2015年 wenky. All rights reserved.
//

import UIKit

typealias CustomCellActionBlock = (CustomTableViewCell) ->Void

protocol CustomTableViewCellDelegate {
    func customTableViewCellDidTapIamgeView(cell: CustomTableViewCell)
}

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var leftTitleLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    
    var delegate: CustomTableViewCellDelegate?
    var tapBlock: CustomCellActionBlock?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "didTapIamgeView")
        iconImageView.addGestureRecognizer(tap)
    }

    func didTapIamgeView() {
        //delegate
        if delegate != nil {
            delegate?.customTableViewCellDidTapIamgeView(self)
        }
        
        //block
        if let block = self.tapBlock {
            block(self)
        }
    }
    
}
