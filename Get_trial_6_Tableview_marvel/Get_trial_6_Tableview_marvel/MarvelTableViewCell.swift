//
//  MarvelTableViewCell.swift
//  Get_trial_6_Tableview_marvel
//
//  Created by iroid on 24/03/21.
//  Copyright © 2021 iroid. All rights reserved.
//

import UIKit

class MarvelTableViewCell: UITableViewCell {
    
    @IBOutlet var NameTxt: UITextField!
    
    @IBOutlet var realNametxt: UITextField!
    
    
    @IBOutlet var teamtxt: UITextField!
    
    @IBOutlet var appeartxt: UITextField!
    
    @IBOutlet var creatortxt: UITextField!
    
    @IBOutlet var imagevw: UIImageView!
    
    @IBOutlet var publisherTXt: UITextField!
    
    @IBOutlet var bioTextvieetxt: UITextView!
    

    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
