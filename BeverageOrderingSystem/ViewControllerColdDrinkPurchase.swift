//
//  ViewControllerColdDrinkPurchase.swift
//  BeverageOrderingSystem
//
//  Created by Lebron James on 2019/1/25.
//  Copyright © 2019 Lebron James. All rights reserved.
//

import UIKit

class ViewControllerColdDrinkPurchase: UIViewController  ,UIPickerViewDelegate,UIPickerViewDataSource {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    @IBOutlet weak var myPickerViewDrink: UIPickerView!
    @IBOutlet weak var stepperQuantity: UIStepper!
    @IBOutlet weak var lblQuantity: UILabel!
    @IBOutlet weak var myPickerViewOption: UIPickerView!
    @IBOutlet weak var btnOK: UIBarButtonItem!
    
    var drinkPrice: Int = 15
    var cupNumber: Int = 0
    
    
    var result: String = ""
    var eachPrices: String = ""
    var strDrink: String = "麥茶 $15"
    var strSweetness: String = "微糖"
    var strIce: String = "微冰"
    var strFeeding: String = "粉條"
    
    var arrayDrink: [String] = [String]()
    var arraySweetness: [String] = [String]()
    var arrayIce: [String] = [String]()
    var arrayFeeding: [String] = [String]()
    
    var arrayprices: [Int] = [15,15,15,15,20]
    
    ///PickerView Protocol
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        //幾個滾輪
        var intnum:Int = 0
        if pickerView == myPickerViewDrink {
            intnum = 1
        }else if pickerView == myPickerViewOption {
            intnum = 3
        }
        return intnum
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        //各有幾筆資料
        var intRowNum: Int = 0
        if myPickerViewDrink == pickerView {
            if component == 0{
                intRowNum = arrayDrink.count
            }
        }else if myPickerViewOption == pickerView {
            if component == 0{
                intRowNum = arraySweetness.count
            }else if component == 1{
                intRowNum = arrayIce.count
            }else if component == 2{
                intRowNum = arrayFeeding.count
            }
        }
        
        return intRowNum
        
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        //集合內容
        var strRow: String = ""
        if myPickerViewDrink == pickerView {
            if component == 0{
                strRow = arrayDrink[row]
            }
        }else if myPickerViewOption ==  pickerView{
            if component == 0{
                strRow = arraySweetness[row]
            }else if component == 1{
                strRow = arrayIce[row]
            }else if component == 2{
                strRow = arrayFeeding[row]
            }
        }
        
        return strRow
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //滾輪停下
        if myPickerViewDrink == pickerView {
            if component == 0{
                strDrink = arrayDrink[row]
                drinkPrice = arrayprices[row]
            }
        }else if myPickerViewOption ==  pickerView{
            if component == 0{
                strSweetness = arraySweetness[row]
            }else if component == 1{
                strIce = arrayIce[row]
            }else if component == 2{
                strFeeding = arrayFeeding[row]
            }
        }
        
    }
    ///endPickerView Protocol
    @IBAction func myStepper_ValueChanged(_ sender: Any) {
        let stepperValue: Double = self.stepperQuantity.value
        self.lblQuantity.text = "\(Int(stepperValue))杯"
        cupNumber = Int(stepperValue)
    }
    
    ///endStepper
    
    ///ok
    @IBAction func btnOK_Click(_ sender: Any) {
        eachPrices = ""
        result = "\(strDrink) 數量: \(String(cupNumber))杯 甜度: \(strSweetness) 冰塊: \(strIce) 加料: \(strFeeding)"
        eachPrices = "$\(String(cupNumber * drinkPrice))"
        
        if cupNumber != 0 {
            
            
            appDelegate.arrayResult.add(self.result)
            print(result)
            appDelegate.arrayEachPrices.add(self.eachPrices)
            print(eachPrices)

            self.navigationItem.prompt = "資料新增成功"
            
            self.perform(#selector(clearPrompt),with: nil,afterDelay: 2.0)
        }else {
            self.navigationItem.prompt = "輸入有誤"
            
            self.perform(#selector(clearPrompt),with: nil,afterDelay: 2.0)
        }
    }
    @objc func clearPrompt(){
        self.navigationItem.prompt = nil
    }

    //endOk
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.myPickerViewDrink.delegate = self
        self.myPickerViewDrink.dataSource = self
        
        self.myPickerViewOption.delegate = self
        self.myPickerViewOption.dataSource = self
        
        arrayDrink = ["紅茶 $15","綠茶 $15","麥茶 $15","烏龍 $15","奶茶 $20"]
        arraySweetness = ["正常","半糖","微糖","無糖"]
        arrayIce = ["正常","微冰","去冰"]
        arrayFeeding = ["珍珠","椰果","粉條","寒天","布丁"]
        myPickerViewDrink.selectRow(2,inComponent: 0, animated: true)
        myPickerViewOption.selectRow(2,inComponent: 0, animated: true)
        myPickerViewOption.selectRow(1,inComponent: 1, animated: true)
        myPickerViewOption.selectRow(2,inComponent: 2, animated: true)
        
       
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
