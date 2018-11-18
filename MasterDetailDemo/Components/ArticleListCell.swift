//
//  ArticleListCell.swift
//  MasterDetailDemo
//
//  Created by Manikandan Sundararajan on 18/11/18.
//  Copyright © 2018 Manikandan Sundararajan. All rights reserved.
//

import UIKit

class ArticleListCell: UITableViewCell {

    @IBOutlet weak var imgOutlineView: UIView!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var byLineLbl: UILabel!
    @IBOutlet weak var sectionLbl: UILabel!
    @IBOutlet weak var dateIcon: UIImageView!
    @IBOutlet weak var dateLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func initCell() {
        imgOutlineView.backgroundColor = UIColor.white
        titleLbl.textColor = UIColor.black
        byLineLbl.textColor = UIColor.lightGray
        sectionLbl.textColor = UIColor.lightGray
        dateLbl.textColor = UIColor.lightGray
        imgView.contentMode = UIView.ContentMode.scaleAspectFit
    }
    
}
