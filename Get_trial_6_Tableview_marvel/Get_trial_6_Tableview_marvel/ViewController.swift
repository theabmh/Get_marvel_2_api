//
//  ViewController.swift
//  Get_trial_6_Tableview_marvel
//
//  Created by iroid on 24/03/21.
//  Copyright © 2021 iroid. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet var Mytable: UITableView!
    
    let getdata = NSMutableData()
    var jsondata = NSArray()
    var jsondict = NSDictionary()
    
    override func viewWillAppear(_ animated: Bool) {
        let jsonurl = URL(string:"https://www.simplifiedcoding.net/demos/marvel/")
        let Request = URLRequest(url: jsonurl!)
        
        let task = URLSession.shared.dataTask(with: Request){(data,request,error) in
            
            if let mydata = data {
                
                print("mydata>>",mydata)
                
                do {
                    self.jsondata = try JSONSerialization.jsonObject(with: mydata, options: []) as! NSArray
                    DispatchQueue.main.async {
                       
                        self.Mytable.reloadData()
                    
                    }
                }
                catch{
                    print(error.localizedDescription)
                }
                }
                
            }
            task.resume()
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    
    
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return jsondata.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tcell = tableView.dequeueReusableCell(withIdentifier: "Marvel", for: indexPath) as! MarvelTableViewCell
        
        self.jsondict = self.jsondata[indexPath.row] as! NSDictionary
        
        tcell.NameTxt.text = String(describing:self.jsondict.value(forKey: "name")!)
        tcell.realNametxt.text = String(describing:self.jsondict.value(forKey: "realname")!)
        tcell.teamtxt.text = String(describing:self.jsondict.value(forKey: "team")!)
        tcell.appeartxt.text = String(describing:self.jsondict.value(forKey: "firstappearance")!)
        tcell.creatortxt.text = String(describing:self.jsondict.value(forKey: "createdby")!)
        tcell.bioTextvieetxt.text = String(describing:self.jsondict.value(forKey: "bio")!)
        tcell.publisherTXt.text = String(describing:self.jsondict.value(forKey: "publisher")!)
        
        let imageurl=URL(string:String(describing:self.jsondict.value(forKey: "imageurl")!))
        let imagedata = try? Data(contentsOf:imageurl!)
        tcell.imagevw.image = UIImage(data:imagedata!)
        
        return tcell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 350
        
        
    }
    

    
}

