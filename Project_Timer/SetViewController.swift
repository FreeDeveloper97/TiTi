//
//  SetViewController.swift
//  Project_Timer
//
//  Created by Min_MacBook Pro on 2020/06/10.
//  Copyright © 2020 FDEE. All rights reserved.
//

import UIKit

class SetViewController: UIViewController {
    @IBOutlet var View1: UIView!
    @IBOutlet var View2: UIView!
    @IBOutlet var InputView1: UIView!
    @IBOutlet var InputView2: UIView!
    @IBOutlet var SetButton: UIButton!
    
    @IBOutlet var H1TextField: UITextField!
    @IBOutlet var M1TextField: UITextField!
    @IBOutlet var H2TextField: UITextField!
    @IBOutlet var M2TextField: UITextField!
    
    @IBOutlet var AllTimeLabel: UILabel!
    @IBOutlet var SecondLabel: UILabel!
    
    var second : Int = 3000
    var sum : Int = 0
    var allTime : Int = 28800
    var temp = 0
    var H1 = ""
    var M1 = ""
    var H2 = ""
    var M2 = ""
    var h1 = 8
    var h2 = 0
    var m1 = 0
    var m2 = 50
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboard()
        
        H1TextField.keyboardType = .numberPad
        M1TextField.keyboardType = .numberPad
        H2TextField.keyboardType = .numberPad
        M2TextField.keyboardType = .numberPad
        
        View1.layer.cornerRadius = 14
        View2.layer.cornerRadius = 14
        InputView1.layer.cornerRadius = 10
        InputView2.layer.cornerRadius = 10
        SetButton.layer.cornerRadius = 10
        
        H1TextField.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: UIControl.Event.editingChanged)
        M1TextField.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: UIControl.Event.editingChanged)
        H2TextField.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: UIControl.Event.editingChanged)
        M2TextField.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: UIControl.Event.editingChanged)
        
        // Do any additional setup after loading the view.
    }
    
    @objc func textFieldDidChange(textField: UITextField){
        H1 = H1TextField.text!
        H2 = H2TextField.text!
        M1 = M1TextField.text!
        M2 = M2TextField.text!
        
        check()
        
        allTime = h1 * 3600 + m1 * 60
        second = h2 * 3600 + m2 * 60
        
        AllTimeLabel.text = printTime(temp: allTime)
        SecondLabel.text = printTime(temp: second)
    }
    
    @IBAction func SetButton(_ sender: UIButton) {
        
        UserDefaults.standard.set(second, forKey: "second")
        UserDefaults.standard.set(allTime, forKey: "allTime")
        print("set complite")
        self.dismiss(animated: true, completion: nil)
    }
    
    func check()
    {
        if (H1 != "")
        {
            h1 = Int(H1)!
            m1 = 0
        }
        if (H2 != "")
        {
            h2 = Int(H2)!
            m2 = 0
        }
        if (M1 != "") { m1 = Int(M1)! }
        if (M2 != "") { m2 = Int(M2)! }
    }
    
    func printTime(temp : Int) -> String
    {
        let S = temp%60
        let H = temp/3600
        let M = temp/60 - H*60
        
        let returnString = String(H) + ":" + String(M) + ":" + String(S)
        return returnString
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

extension UIViewController {
    func hideKeyboard() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self,
            action: #selector(UIViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
