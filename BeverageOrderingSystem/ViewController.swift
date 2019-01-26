//
//  ViewController.swift
//  BeverageOrderingSystem
//
//  Created by Lebron James on 2019/1/25.
//  Copyright © 2019 Lebron James. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource{
   
    @IBOutlet weak var btnAdd: UIBarButtonItem!
    @IBOutlet weak var btnEdit: UIBarButtonItem!
    @IBOutlet weak var myTableViewShoppingCart: UITableView!
    //儲存總金額
    var total: Int = 0
    let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
    
    
    @IBAction func btnEdit_Click(_ sender: Any) {
        if self.myTableViewShoppingCart.isEditing == true{
            self.myTableViewShoppingCart.setEditing(false, animated: true)
           
            self.btnEdit.title = "編輯"
            self.btnEdit.tintColor = #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)
            
        }else {
            self.myTableViewShoppingCart.setEditing(true, animated: true)
            self.btnEdit.title = "完成"
            self.btnEdit.tintColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
            
        }
    }
    
    
    ///TableView Delegate protocol
    func numberOfSections(in tableView: UITableView) -> Int {
        total = 0
        
        var arrayprice: [String]
        
        for price in appDelegate.arrayEachPrices {
            
            var splitnum:String  = String(("\(price)".split(separator: "$"))[0])
            total += Int(splitnum)!
            print(total)
        }
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("numberOfRowsInSection")
        var rowNum: Int = 0
        
        rowNum = appDelegate.arrayResult.count
        
        return rowNum
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        print("titleForHeaderInSection")
        //開始群組
        var strTitle: String = ""
       
        strTitle = "選擇的商品"
        
        return strTitle
    }
    
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        print("titleForFooterInSection")
        //結束群組
        var strTitle: String = "總價錢: "
         strTitle += String(total)
        
        return strTitle
    }
   
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("cellForRowAt")
        //回傳儲存格
        let cellID: String = "cell" //cell identifier
        var cell: UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: cellID)
        if cell == nil{
            cell = UITableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: cellID)
        }
        //建立新的
        cell?.textLabel?.text = appDelegate.arrayEachPrices[indexPath.row] as? String
        cell?.detailTextLabel?.text = appDelegate.arrayResult[indexPath.row] as? String
        //cell?.imageView?.image = UIImage(named: "apple_small.png")
//        appDelegate.arrayEachPrices[indexPath.row] as? String
        return cell!
    }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        print("commit editingStyle")
        if editingStyle == UITableViewCell.EditingStyle.delete{
            
            appDelegate.arrayEachPrices.removeObject(at: indexPath.row)
            appDelegate.arrayResult.removeObject(at: indexPath.row)
           
            tableView.reloadData()
        }
    }
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        print("canMoveRowAt indexPath")
       
        //any包含基本型態 //AnyObject不包含基本型態
        let itemR: AnyObject = appDelegate.arrayResult[sourceIndexPath.row]as AnyObject
        let itemE: AnyObject = appDelegate.arrayEachPrices[sourceIndexPath.row]as AnyObject
        appDelegate.arrayEachPrices.remove(itemE)
        appDelegate.arrayResult.remove(itemR)
        appDelegate.arrayEachPrices.insert(itemE, at: destinationIndexPath.row)
        appDelegate.arrayResult.insert(itemR, at: destinationIndexPath.row)
            
        
        tableView.reloadData()
    }
    ///end TableView Delegate protocol
    
    //第二(執行多次)
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.myTableViewShoppingCart.reloadData()
    }
    
    //第三個->ViewdidAppear(執行一次)
    
    //先載入,第一(執行一次)

    override func viewDidLoad() {
        super.viewDidLoad()
        self.myTableViewShoppingCart.delegate = self
        self.myTableViewShoppingCart.dataSource = self
            
//        appDelegate.arrayResult = ["one","two","three","four","five"]
        
        }

}


