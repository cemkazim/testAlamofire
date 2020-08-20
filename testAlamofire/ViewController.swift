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

    var request = AF.request("https://demo2066974.mockable.io/")

    var myArray = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        getMyData()
    }

    func getMyData() {
        request.responseDecodable(of: DataModel.self) { [weak self] (response) in
            guard let data = response.value, let strongSelf = self else { return }
            strongSelf.myArray.append(data.name)
            strongSelf.myArray.append(data.job)
            strongSelf.myArray.append(data.artist)
        }
    }

    @IBAction func dataFetchingButton(_ sender: UIBarButtonItem) {
        
    }
}
