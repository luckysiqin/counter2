//
//  ViewController.swift
//  counter
//
//  Created by 20131105804 on 16/5/5.
//  Copyright © 2016年 计分器. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var oneagriculture: UILabel!
    @IBOutlet weak var twoagriculture: UILabel!
    @IBOutlet weak var threeagriculture: UILabel!
    

    @IBAction func oneadd(sender: AnyObject) {
        var a:Int32=0
        var b:Int32=0
        var c:Int32=0
        if(!oneagriculture.text!.isEmpty){
            a=(oneagriculture.text! as NSString).intValue
        }
        if(!agriculturescore.text!.isEmpty){
            b=(agriculturescore.text! as NSString).intValue
        }
        c=a+b
        agriculturescore.text="\(c)"
    }
  
    @IBAction func twoadd(sender: AnyObject) {
        var a:Int32=0
        var b:Int32=0
        var c:Int32=0
        if(!twoagriculture.text!.isEmpty){
            a=(twoagriculture.text! as NSString).intValue
        }
        if(!agriculturescore.text!.isEmpty){
            b=(agriculturescore.text! as NSString).intValue
        }
        c=a+b
        agriculturescore.text="\(c)"
    }
    @IBAction func threeadd(sender: AnyObject) {
        var a:Int32=0
        var b:Int32=0
        var c:Int32=0
        if(!threeagriculture.text!.isEmpty){
            a=(threeagriculture.text! as NSString).intValue
        }
        if(!agriculturescore.text!.isEmpty){
            b=(agriculturescore.text! as NSString).intValue
        }
        c=a+b
        agriculturescore.text="\(c)"
    }

    @IBOutlet weak var oneteach: UILabel!
    @IBOutlet weak var twoteach: UILabel!
    @IBOutlet weak var threeteach: UILabel!

    @IBAction func addone(sender: AnyObject) {
        var d:Int32=0
        var e:Int32=0
        var f:Int32=0
        if(!oneteach.text!.isEmpty){
            d=(oneteach.text! as NSString).intValue
        }
        if(!teachscore.text!.isEmpty){
            e=(teachscore.text! as NSString).intValue
        }
        f=d+e
        teachscore.text="\(f)"
    }
    @IBAction func addtwo(sender: AnyObject) {
        var d:Int32=0
        var e:Int32=0
        var f:Int32=0
        if(!twoteach.text!.isEmpty){
            d=(twoteach.text! as NSString).intValue
        }
        if(!teachscore.text!.isEmpty){
            e=(teachscore.text! as NSString).intValue
        }
        f=d+e
        teachscore.text="\(f)"
    }

    @IBAction func addthree(sender: AnyObject) {
        var d:Int32=0
        var e:Int32=0
        var f:Int32=0
        if(!threeteach.text!.isEmpty){
            d=(threeteach.text! as NSString).intValue
        }
        if(!teachscore.text!.isEmpty){
            e=(teachscore.text! as NSString).intValue
        }
        f=d+e
        teachscore.text="\(f)"
    }
    
    @IBOutlet weak var agriculturescore: UILabel!
    var x:Double=0.0;
    var y:Double=0.0;
    @IBOutlet weak var teachscore: UILabel!
    var x1:Double=0.0;
    var y2:Double=0.0;
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

