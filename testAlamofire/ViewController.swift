//
//  ViewController.swift
//  testAlamofire
//
//  Created by Cem Kazım on 20.08.2020.
//  Copyright © 2020 Cem Kazım. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    @IBOutlet weak var customStackView: UIStackView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var siteLabel: UILabel!
    @IBOutlet weak var objectLabel: UILabel!
    
    var request = AF.request("https://demo0634638.mockable.io/")

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func getMyData() {
        request.responseDecodable(of: DataModel.self) { [weak self] (response) in
            guard let data = response.value, let strongSelf = self else { return }
            strongSelf.nameLabel.text = data.name
            strongSelf.siteLabel.text =  data.site
            strongSelf.objectLabel.text = data.object
        }
    }

    @IBAction func fetchDataButtonClicked(_ sender: UIButton) {
        getMyData()
    }
}
