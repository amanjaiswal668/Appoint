//
//  SosViewController.swift
//  Appoint
//
//  Created by Aman Jaiswal on 11/04/20.
//  Copyright © 2020 Aman Jaiswal. All rights reserved.
//

import UIKit

class SosViewController: UIViewController {

//  Start of connection of IBOutlets of textfields and button in SignUpViewController!
        @IBOutlet weak var doctorResult: UITableView!
    
// Data of doctor card to be displayed on custom table view cell.
    var  doctorName = ["Dr.Abc", "Dr.Pqr", "Dr.qwe","Dr.Abc", "Dr.Pqr", "Dr.qwe"]
   
    var hospitalName = ["Local Hospital", "City Hospital", "Govt. Hospital","Local Hospital", "City Hospital", "Govt. Hospital"]
    
    let doctorImage = [UIImage(named: "doctorface"), UIImage(named: "femaledoctor"), UIImage(named: "doctorface"), UIImage(named: "femaledoctor"), UIImage(named: "doctorface"),  UIImage(named: "femaledoctor")]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //Register xib file for doctor table view cell.
        
        doctorResult.register(UINib(nibName: "DoctorTableViewCell", bundle: nil), forCellReuseIdentifier: "DoctorTableViewCell")
    }
   


}

//Extension for connection of table view cell and dynamically incerment of cell.

extension SosViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return doctorName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DoctorTableViewCell", for: indexPath) as! DoctorTableViewCell

        cell.doctorName?.text = doctorName[indexPath.row]
        cell.hospitalName?.text = hospitalName[indexPath.row]
        cell.doctorImage.image = doctorImage[indexPath.row]
        
        cell.cellDelegate = self
        cell.index = indexPath
        cell.layer.borderColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
           cell.layer.borderWidth = 2
        return cell
    }
    
}

//  code for calling AppointmentViewController as a landing page when clicked on consult button.
extension SosViewController: TableViewCell{
    func doctorContact(index: Int) {
        let AppointmetViewController = self.storyboard?.instantiateViewController(identifier: Constants.Storyboard.AppointmentViewController) as? AppointmetViewController
        
        self.view.window?.rootViewController = AppointmetViewController
        self.view.window?.makeKeyAndVisible()

    }
}
