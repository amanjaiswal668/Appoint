//
//  DoctorTableViewCell.swift
//  Appoint
//
//  Created by Aman Jaiswal on 11/04/20.
//  Copyright © 2020 Aman Jaiswal. All rights reserved.
//

import UIKit

// Creation of protocall for connecting consult button to view controller and hence to show AppointmentViewController as a landing page.

protocol TableViewCell{
    func doctorContact(index: Int)
}

class DoctorTableViewCell: UITableViewCell {

// Start of connection of IBOutlets of textfields and button in SignUpViewController!
    
    @IBOutlet weak var doctorImage: UIImageView!
    
    @IBOutlet weak var doctorView: UIView!
    
    @IBOutlet weak var hospitalName: UILabel!
    
    @IBOutlet weak var doctorName: UILabel!
    
    @IBOutlet weak var contactDoctor: UIButton!

//    Declearation of protocol delegate.
    var cellDelegate: TableViewCell?
    var index: IndexPath?
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
 
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
// Tap on Consult Button to transist user to show AppointmentViewController as a landing page. Reference:- SosViewController.
    @IBAction func doctorContact(_ sender: Any) {
        
        cellDelegate?.doctorContact(index: (index?.row)!)
    }
}






