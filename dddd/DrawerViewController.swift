//
//  DrawerViewController.swift
//  ePathshala iOS
//
//  Created by iLoma Technology on 04/06/19.
//  Copyright © 2019 Mayur. All rights reserved.
//

import UIKit

class DrawerViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var tblViewTopConstr: NSLayoutConstraint!
    
    @IBOutlet weak var lblVersionName: UILabel!
    @IBOutlet weak var tblView: UITableView!
    
    @IBOutlet weak var btnAddStudent: UIButton!
    
    let screenWidth = SCREEN_WIDTH * 0.8
    var arrTitles : [String]!
    var arrImages : [String]!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        //let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String

        
        arrTitles = ["Change Account","About Us","Privacy Policy","Logout","Version \(VIEWMANAGER.getAppVersion()!)"]
        print(arrTitles)
        arrImages = ["ic_change_account","ic_about","ic_privacy_policy","ic_logout","ic_version"]
        tblView.estimatedRowHeight = 60
        tblView.rowHeight = UITableView.automaticDimension
        tblView.bounces = false
        tblView.register(UINib(nibName: "DrawerCell", bundle: nil), forCellReuseIdentifier: "DrawerCell")
        tblViewTopConstr.constant = IS_IPHONE_X ? -45 : -20

        tblView.tableHeaderView = tableHeaderView()
        
        
//        lblVersionName.text = "Version Name : \(appVersion!)"
//        lblVersionName.textAlignment = .center

        
    }
    
    
    func tableHeaderView() -> UIView
    {
        let viewHeader = MaterialView(frame: CGRect(x: 0, y: 0, width: screenWidth, height: 200))
        viewHeader.backgroundColor = UIColor.appDarkThemeColor

        let imgViewLogo = UIImageView(frame: CGRect(x: viewHeader.frame.minX, y: IS_IPHONE_X ? 60 : 40, width: 300, height: 100))
        imgViewLogo.contentMode = .scaleAspectFit
        imgViewLogo.image = UIImage(named: "img_logo_splash")
        viewHeader.addSubview(imgViewLogo)

//        let imgViewDP = UIImageView(frame: CGRect(x: viewHeader.frame.midX - 50, y: imgViewLogo.frame.maxY + 5, width: 80, height: 80))
//        imgViewDP.layer.cornerRadius = 40
//        imgViewDP.layer.borderWidth = 2.0;
//        imgViewDP.layer.borderColor = UIColor.white.cgColor
//        imgViewDP.layer.masksToBounds = true
////        imgViewDP.sd_setImage(with: URL(string: "\(MEDIA_BASE_URL)\(VIEWMANAGER.currentUser!.imageUrl!.replacingOccurrences(of: " ", with: "%20"))"), placeholderImage: UIImage(named: "ic_placeholder"))
//        viewHeader.addSubview(imgViewDP)

//        let lblGymName = UILabel(frame: CGRect(x: 10, y: imgViewDP.frame.maxY , width: viewHeader.frame.size.width - 20, height: 30))
//        lblGymName.font = UIFont.appMediumFont(size: 16)
//      //  lblGymName.text = VIEWMANAGER.currentUser?.gymName
//        lblGymName.textColor = .white
//        lblGymName.textAlignment = .center
//        viewHeader.addSubview(lblGymName)

        viewHeader.addGradientColor(color1: UIColor.appDarkThemeColor, color2: UIColor.appLightThemeColor)

        return viewHeader
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrTitles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DrawerCell") as! DrawerCell
        cell.selectionStyle = .none
        cell.lblTitle.text = arrTitles[indexPath.row]
        cell.imgView.image = UIImage(named: arrImages[indexPath.row])?.withRenderingMode(.alwaysTemplate)
        cell.imgView.tintColor = UIColor.gray
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let controller = self.parent as! KYDrawerController
        controller.setDrawerState(.closed, animated: true)
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: DRAWER_SELECTION_NOTIFICATION), object: indexPath.row)
    }

    @IBAction func btnAddStudentClicked(_ sender: Any) {
        pushToAddAccVC()
    }
    func pushToAddAccVC(){
        
        let controller = self.parent as! KYDrawerController
        controller.setDrawerState(.closed, animated: true)
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: ADD_STUDENT_NOTIFICATION), object:nil)
    }
}
