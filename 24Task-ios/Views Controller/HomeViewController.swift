//
//  HomeViewController.swift
//  24Task-ios
//
//  Created by Active Mac Lap 01 on 23/04/23.
//

import UIKit
import TTGTags

class HomeViewController: UIViewController {
      
      
        @IBOutlet weak var tableView: UITableView!
        @IBOutlet weak var searchBar: UISearchBar!
          
        var dataSourceArr = ["John", "David" ,"Mike", "Smith", "Josh", "Michhel", "Barac", "Donald"]
    
        var cell1_dataSource = ["Hourly rate","Catagory","Language","Ratings","Under $13","Under $6","Under $3"]
    
    
    
        var filteredArr = Array<String>()
        var searching:Bool?
          
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
    }

    func configureViews() {
        tableView.delegate = self
        tableView.dataSource = self
        searchBar.delegate = self
        
        let tagView = TTGTextTagCollectionView()
        self.view.addSubview(tagView)

        tagView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tagView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            tagView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            tagView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            tagView.heightAnchor.constraint(equalToConstant: 100)
        ])

        let textTags = cell1_dataSource.map { TTGTextTag(content: TTGTextTagStringContent(text: $0), style: TTGTextTagStyle()) }
        

        // Add tag
        for text in cell1_dataSource {
            let textTag = TTGTextTag(content: TTGTextTagStringContent(text: text), style: TTGTextTagStyle())
            tagView.addTag(textTag)
        }
        tagView.reload()
    }
    }
      
      
    extension HomeViewController : UITableViewDelegate {
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 80
        }
    }
      
      
    extension HomeViewController : UITableViewDataSource{
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            let textTag = TTGTextTag(content: TTGTextTagStringContent(text: cell1_dataSource.joined(separator: ",")), style: TTGTextTagStyle())
            
            if(searching ?? false){
                return filteredArr.count
            }else{
                return dataSourceArr.count
            }
              
        }
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell_1 = tableView.dequeueReusableCell(withIdentifier: "TableViewCell1")!
            let cell_2 = tableView.dequeueReusableCell(withIdentifier: "TableViewCell2")!
            let cell_3 = tableView.dequeueReusableCell(withIdentifier: "TableViewCell3")!
            if(!(searching ?? false)){
                cell_1.textLabel?.text = dataSourceArr[indexPath.row]
            }else{
                cell_1.textLabel?.text = filteredArr[indexPath.row]
            }
             
            return cell_1
        }
    }
      
      
    extension HomeViewController : UISearchBarDelegate{
        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
              
            if(searchText.isEmpty){
                filteredArr = dataSourceArr
            }else{
                filteredArr = dataSourceArr.filter{$0.contains(searchText)}
            }
            searching = true
            tableView.reloadData()
        }
         
    }
