//
//  CustomTabTableViewVC.swift
//  TabTableview
//
//  Created by Dipak on 10/04/1943 Saka.
//

import UIKit

class CustomTabTableViewVC: UIViewController {

    private var cityState = [Int]()
    private let mytableview = UITableView()
    private var cityArr = ["Indian","Italian","Chinise"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        view.backgroundColor = .tertiarySystemGroupedBackground
        title = "page2"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(funrefresh))
        view.addSubview(mytableview)
        setuptable()
    }
    @objc func funrefresh()
    {
        view.backgroundColor  = .cyan
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        mytableview.frame = CGRect(x: 0, y: view.safeAreaInsets.top, width: view.width, height: view.height - view.safeAreaInsets.top - view.safeAreaInsets.bottom)
    }
}
extension CustomTabTableViewVC:UITableViewDelegate,UITableViewDataSource
{
    private func setuptable()
    {
        mytableview.delegate = self
        mytableview.dataSource = self
        mytableview.register(CityCell.self, forCellReuseIdentifier: "citycell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        cityArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "citycell", for: indexPath) as! CityCell
        
        cell.setupcitycellwith(title:cityArr[indexPath.row],index:indexPath.row,and:(cityState.contains(indexPath.row) ? true :false))
        
        cell.myButton.addTarget(self, action: #selector(openCityDetails), for: .touchUpInside)
        
        return cell
    }
    @objc private func openCityDetails(_ sender:UIButton) {
//        navigationController?.pushViewController(WebViewController(search: cityArray[sender.tag]), animated: true)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let cell = tableView.cellForRow(at: indexPath) as! CityCell
        if !cityState.contains(indexPath.row) {
            cityState.append(indexPath.row)
            cell.animateCell(at: indexPath.row)
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            mytableview.beginUpdates()
            cityArr.remove(at: indexPath.row)
            mytableview.deleteRows(at: [indexPath], with: .fade)
            mytableview.endUpdates()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
    
    
    
}
