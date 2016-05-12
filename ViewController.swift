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
        saveMark()
    }
    
    @IBAction func onesubtract(sender: AnyObject) {
        if(!agrscore.text!.isEmpty) {
            a=(agrscore.text! as NSString).integerValue
            if a>0{
                a=a-1
                agrscore.text=("\(a)")
            }
            agrscore.text=("\(a)")
        } else {
            if a>0{
                a=a-1
                agrscore.text=("\(a)")
            }
            agrscore.text=("\(a)")
        }
        saveUser()
        saveMark()
    }
    
    @IBAction func addtwo(sender: AnyObject) {
        if(!agrscore.text!.isEmpty) {
            a=(agrscore.text! as NSString).integerValue
            a=a+2
            agrscore.text=("\(a)")
        } else {
            a=a+2
            agrscore.text=("\(a)")
        }
        saveUser()
        saveMark()
    }
    @IBAction func addthree(sender: AnyObject) {
        if(!agrscore.text!.isEmpty) {
            a=(agrscore.text! as NSString).integerValue
            a=a+3
            agrscore.text=("\(a)")
        } else {
            a=a+3
            agrscore.text=("\(a)")
        }
        saveUser()
        saveMark()
    }
    
    @IBAction func addone2(sender: AnyObject) {
        if(!teascore.text!.isEmpty) {
            b=(teascore.text! as NSString).integerValue
            b=b+1
            teascore.text=("\(b)")
        } else {
            b=b+1
           teascore.text=("\(b)")
        }
        saveUser()
        saveMark()
    }
    
    @IBAction func subtracttwo2(sender: AnyObject) {
        if(!teascore.text!.isEmpty) {
            b=(teascore.text! as NSString).integerValue
            if b>0{
                b=b-1
                teascore.text=("\(b)")
            }
            teascore.text=("\(b)")
        } else {
            if b>0{
                b=b-1
                teascore.text=("\(b)")
            }
            teascore.text=("\(b)")
        }
        saveUser()
        saveMark()
    }
    
    @IBAction func addtwo2(sender: AnyObject) {
        if(!teascore.text!.isEmpty) {
            b=(teascore.text! as NSString).integerValue
            b=b+2
            teascore.text=("\(b)")
        } else {
            b=b+2
            teascore.text=("\(b)")
        }
        saveUser()
        saveMark()
    }
    @IBAction func addthree2(sender: AnyObject) {
        if(!teascore.text!.isEmpty) {
            b=(teascore.text! as NSString).integerValue
            b=b+3
            teascore.text=("\(b)")
        } else {
            b=b+3
            teascore.text=("\(b)")
        }
        saveUser()
        saveMark()
    }
    
    @IBAction func clean(sender: AnyObject) {
       agrscore.text = "0"
        teascore.text = "0"
        saveUser()
        saveMark()
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //获取数据库实例
        db = SQLiteDB.sharedInstance()
        //如果表还不存在则创建表（其中uid为自增主键）
        db.execute("create table if not exists t_user(uid integer primary key,txtagrtroop varchar(20),txtteachtroops varchar(20))")
         db.execute("create table if not exists t_mark(uid integer primary key,txtagrtroop varchar(20),txtteachtroops varchar(20))")
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
             agronomy.text = user["agronomy"] as? String
            teach.text = user["teach"] as? String
        }
    }
    func initMark() {
        let data = db.query("select * from t_user")
        if data.count > 0 {
            //获取最后一行数据显示
            let user = data[data.count - 1]
            agrscore.text = user["agrscore"] as? String
            teascore.text = user["teascore"] as? String
        }
    }

    //保存数据到SQLite
    func saveUser() {
        let agronomy = self.agronomy.text!
        let teach = self.teach.text!
        //插入数据库，这里用到了esc字符编码函数，其实是调用bridge.m实现的
        let sql = "insert into t_user(agronomy,teach) values('\(agronomy)','\(teach)')"
        print("sql: \(sql)")
        //通过封装的方法执行sql
        let result = db.execute(sql)
        print(result)
    }
    
    func saveMark() {
        let agrscore = self.agrscore.text!
        let teascore = self.teascore.text!
        //插入数据库，这里用到了esc字符编码函数，其实是调用bridge.m实现的
        let sql1 = "insert into t_mark(agrscore,teascore) values('\(agrscore)','\(teascore)')"
        print("sql1: \(sql1)")
        //通过封装的方法执行sql
        let result1 = db.execute(sql1)
        print(result1)
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

