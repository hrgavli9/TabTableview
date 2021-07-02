//
//  SimpleTabTableViewVC.swift
//  TabTableview
//
//  Created by Dipak on 10/04/1943 Saka.
//

import UIKit

class SimpleTabTableViewVC: UIViewController {

    private var stateArray = ["Andhra Pradesh", "Arunachal Pradesh", "Assam", "Bihar", "Chhattisgarh", "Goa", "Gujarat", "Haryana", "Himachal Pradesh", "Jammu and Kashmir", "Jharkhand", "Karnataka", "Kerala", "Madhya Pradesh", "Maharashtra", "Manipur", "Meghalaya", "Mizoram", "Nagaland", "Odisha", "Punjab", "Rajasthan", "Sikkim", "Tamil Nadu", "Telangana", "Tripura", "Uttarakhand", "Uttar Pradesh", "West Bengal", "Andaman and Nicobar Islands", "Chandigarh", "Dadra and Nagar Haveli", "Daman and Diu", "Delhi", "Lakshadweep", "Puducherry"]
    
    private let mytableview = UITableView()
    private let mysearchbar = UISearchBar()
    private var searchdata = [String]()
    private var arrtouse = [String]()
    private var searching = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "page 1"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(funrefresh))
//        view.backgroundColor = .white
        view.addSubview(mysearchbar)
        mysearchbar.delegate = self
        
        view.addSubview(mytableview)
        setuptable()
    }
    @objc func funrefresh()
    {
        view.backgroundColor = .cyan
        stateArray.shuffle()
        mytableview.reloadData()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        mysearchbar.frame = CGRect(x: 10, y: view.safeAreaInsets.top, width: view.width, height:60)
        mytableview.frame = CGRect(x: 10, y:mysearchbar.bottom+10, width: view.width, height: view.height-view.safeAreaInsets.top-view.safeAreaInsets.bottom-50)
    }
}

extension SimpleTabTableViewVC:UITableViewDataSource, UISearchBarDelegate, UITableViewDelegate{
    
    private func setuptable()
    {
        mytableview.delegate = self
        mytableview.dataSource = self
        mytableview.register(UITableViewCell.self, forCellReuseIdentifier: "StateData")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        searching ? searchdata.count : stateArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if searching
        {
            arrtouse = searchdata
        }
        else
        {
            arrtouse = stateArray
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "StateData", for: indexPath)
        cell.textLabel?.text = arrtouse[indexPath.row]
        return cell
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String)
    {
        if searchText.count == 0 {
            searching = false
        } else {
            searching = true
            searchdata = stateArray.filter( { $0.lowercased().hasPrefix(searchText.lowercased()) } )
        }
        
        mytableview.reloadData()
    }
}
