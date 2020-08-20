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

    @IBOutlet weak var myTableView: UITableView!

    var request = AF.request("https://demo2066974.mockable.io/")

    var myArray = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupForTableView()
        getMyData()
    }

    func setupForTableView() {
        myTableView.delegate = self
        myTableView.dataSource = self
    }

    func reloadTableView() {
        myTableView.reloadData()
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
        if myArray == [] {
            getMyData()
        }
        reloadTableView()
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "MyTableViewCellId") as? MyTableViewCell {
            cell.myTableViewCellLabel.text = myArray[indexPath.row]
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            myArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}
