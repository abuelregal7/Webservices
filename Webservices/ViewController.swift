//
//  ViewController.swift
//  Webservices
//
//  Created by Abdallh on 12/25/18.
//  Copyright © 2018 Abdullah Tarek. All rights reserved.
//

import UIKit
import Alamofire
import  SwiftyJSON

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate{
    
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        
        let cell   = tableview.dequeueReusableCell(withIdentifier: "DeptsTableViewCell") as!  DeptsTableViewCell
        
        let dic  :  [String  : Any]   = array[indexPath.row]
        
        cell.titleLbl.text =  dic["name"] as! String
        return cell
    }
    
    var array : [  [String  : Any]   ]  = []
    let url = "http://luqia.net/api/depts"
    
    @IBOutlet weak var tableview: UITableView!
    
    override func viewDidLoad() {
        
        
        tableview.dataSource = self
        tableview.delegate = self
        
        
        
        
        
        
        super.viewDidLoad()
        
        Alamofire.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil)
        
            .responseJSON { response in
                
                
                
                
                switch response.result {
                    
                    
                case .failure(let error)  :
                    print(error)
                    
                case .success(let value):
                    
                    
                    
                    let json =  JSON.init(value)
                    
                    //
                    let status = json["status"].string
                    print("status is ", status)
                    
                    
                    
                    let data  = json["data"].array

                    
                    for item in data!
                    {
                        
                        
                        let dic  = [ "id " : item["id"].int   , "name" : item["name"] .string] as! [String : Any]
                        self.array.append(dic)
                        
                        
                    }
                    
                    self.tableview.reloadData()
                    
                    
                    print( "IDSIDS" , self.array)
                    
                    
                    
                    
                    
                    
                    
//                    let arr = json["data"].array
//                    for item in arr {
//
//                      let value = item
//
//
//                    }
//
                    
                    
                    
                }
                
                
        }
        
        // Do any additional setup after loading the view, typically from a nib.
    }


}




