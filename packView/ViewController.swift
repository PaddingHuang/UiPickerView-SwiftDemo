//
//  ViewController.swift
//  packView
//
//  Created by HUA on 16/10/21.
//  Copyright © 2016年 HUA. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
 var  pickerView = UIPickerView()
    var toolBar = UIToolbar()
      var text = UITextField()
    override func viewDidLoad() {
        super.viewDidLoad()
      
        //将dataSource设置成自己
        pickerView.dataSource = self
        //将delegate设置成自己
        pickerView.delegate = self
        //设置选择框的默认值
        pickerView.selectRow(1,inComponent:0,animated:true)
        pickerView.selectRow(2,inComponent:1,animated:true)
        pickerView.selectRow(3,inComponent:2,animated:true)
//        self.view.addSubview(pickerView)
        toolBar.frame = CGRect.init(x: 0, y: 0, width:self.view.frame.size.width , height: 44)
        let flexSpace = UIBarButtonItem.init(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        let finish = UIBarButtonItem.init(title: "完成", style: .plain, target: self, action: #selector(finishs))
        toolBar.items = [flexSpace,finish]
        
        //建立一个按钮，触摸按钮时获得选择框被选择的索引
        let button = UIButton(frame:CGRect(x:0, y:0, width:100, height:30))
        button.center = self.view.center
        button.backgroundColor = UIColor.blue
        button.setTitle("获取信息",for:.normal)
        button.addTarget(self, action:#selector(finishs),
                         for: .touchUpInside)
        self.view.addSubview(button)
        
    
        text.frame = CGRect(x:0, y:100, width:100, height:30)
        text.backgroundColor = UIColor.red
        self.view.addSubview(text)
        text.inputView = pickerView
        text.inputAccessoryView = toolBar
    }

    //设置选择框的列数为3列,继承于UIPickerViewDataSource协议
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    //设置选择框的行数为9行，继承于UIPickerViewDataSource协议
    func pickerView(_ pickerView: UIPickerView,
                    numberOfRowsInComponent component: Int) -> Int {
        return 9
    }
    
    //设置选择框各选项的内容，继承于UIPickerViewDelegate协议
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int,
                    forComponent component: Int) -> String? {
        return String(row)+"-"+String(component)
    }
    
    //触摸按钮时，获得被选中的索引
    func finishs(){
        let message = String(pickerView.selectedRow(inComponent: 0)) + "-"
            + String(pickerView.selectedRow(inComponent: 1)) + "-"
            + String(pickerView.selectedRow(inComponent: 2))
//        let alertController = UIAlertController(title: "被选中的索引为",
//                                                message: message, preferredStyle: .alert)
//        let okAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
//        alertController.addAction(okAction)
//        self.present(alertController, animated: true, completion: nil)
        text.text = message
        text.resignFirstResponder()
    }
    

}

