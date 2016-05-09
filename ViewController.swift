//
//  ViewController.swift
//  counter
//
//  Created by 20131105804 on 16/5/5.
//  Copyright © 2016年 计分器. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var db:SQLiteDB!
    
    @IBOutlet weak var agronomy: UILabel!
    @IBOutlet weak var teach: UILabel!
    @IBOutlet weak var agrscore: UITextField!
    @IBOutlet weak var teascore: UITextField!
    
    var a=0
    var b=0
    
    @IBAction func addone(sender: AnyObject) {
        if(!agrscore.text!.isEmpty) {
            a=(agrscore.text! as NSString).integerValue
            a=a+1
            agrscore.text=("\(a)")
        } else {
            a=a+1
            agrscore.text=("\(a)")
        }
        saveUser()
        
    }
    
    @IBAction func onesubtract(sender: AnyObject) {
        
    }
    
    @IBAction func addtwo(sender: AnyObject) {
        
    }
    @IBAction func addthree(sender: AnyObject) {
        
    }
    
    
    
    
    
    
    
    @IBOutlet var txtagrtroop: UITextField!
    @IBOutlet var txtteachtroops: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //获取数据库实例
        db = SQLiteDB.sharedInstance()
        //如果表还不存在则创建表（其中uid为自增主键）
        db.execute("create table if not exists t_user(uid integer primary key,txtagrtroop varchar(20),txtteachtroops varchar(20))")
        //如果有数据则加载
        initUser()
    }
    
    //点击保存
    @IBAction func saveClicked(sender: AnyObject) {
        saveUser()
    }
    
    //从SQLite加载数据
    func initUser() {
        let data = db.query("select * from t_user")
        if data.count > 0 {
            //获取最后一行数据显示
            let user = data[data.count - 1]
             txtagrtroop.text = user["agrtroop"] as? String
            txtteachtroops.text = user["teachtroops"] as? String
        }
    }
    
    //保存数据到SQLite
    func saveUser() {
        let agrtroop = self.txtagrtroop.text!
        let teachtroops = self.txtteachtroops.text!
        //插入数据库，这里用到了esc字符编码函数，其实是调用bridge.m实现的
        let sql = "insert into t_user(agrtroop,teachtroops) values('\(agrtroop)','\(teachtroops)')"
        print("sql: \(sql)")
        //通过封装的方法执行sql
        let result = db.execute(sql)
        print(result)
    }
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

