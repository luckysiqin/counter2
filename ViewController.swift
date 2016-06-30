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
    var KeepTime:NSTimer!
    var Timer:Int = 0
    
    @IBOutlet weak var agronomy: UILabel!
    @IBOutlet weak var teach: UILabel!
    @IBOutlet weak var agrscore: UITextField!
    @IBOutlet weak var teascore: UITextField!
    @IBOutlet weak var Timeone: UILabel!
    @IBOutlet weak var Timetwo: UILabel!
    
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
        saveTime()
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
        saveTime()
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
        saveTime()
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
        saveTime()
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
        saveTime()
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
        saveTime()
    }
    
    @IBAction func empty(sender: AnyObject) {
        agrscore.text = "0"
        teascore.text = "0"
        Timeone.text = "0"
        Timetwo.text = "0"
        KeepTime.invalidate()
        saveUser()
        saveMark()
    }

    @IBAction func start(sender: AnyObject) {
        KeepTime = NSTimer.scheduledTimerWithTimeInterval(1,target:self,selector:Selector("tickDown"),
            userInfo:nil,repeats:true)
    }
    func tickDown()
    {
        Timer++
        let sec = Timer%60
        let min = Timer/60
        Timeone.text = String(min)
        Timetwo.text = String(sec)
        saveUser()
        saveMark()
        saveTime()
    }
    
    @IBAction func Stop(sender: AnyObject) {
        KeepTime.invalidate()
        saveUser()
        saveMark()
        saveTime()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //获取数据库实例
        db = SQLiteDB.sharedInstance()
        //如果表还不存在则创建表（其中uid为自增主键）
        db.execute("create table if not exists t_user(uid integer primary key,agronomy varchar(20),teach varchar(20))")
        initUser()
         db.execute("create table if not exists t_mark(uid integer primary key,agrscore varchar(20),teascore varchar(20))")
        initMark()
          db.execute("create table if not exists t_Time(uid integer primary key,min varchar(20),sec varchar(20))")
        initTime() 
         //如果有数据则加载
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
        let data = db.query("select * from t_mark")
        if data.count > 0 {
            //获取最后一行数据显示
            let mark = data[data.count - 1]
            agrscore.text = mark["agrscore"] as? String
            teascore.text = mark["teascore"] as? String
        }
    }
    func initTime() {
        let data = db.query("select * from t_time")
        if data.count > 0 {
            //获取最后一行数据显示
            let time = data[data.count - 1]
            Timeone.text = time["min"] as? String
            Timetwo.text = time["sec"] as? String
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

    func saveTime() {
        let Timeone = self.Timeone.text!
        let Timetwo = self.Timetwo.text!
        //插入数据库，这里用到了esc字符编码函数，其实是调用bridge.m实现的
        let sql2 = "insert into t_time(min,sec) values('\(Timeone)','\(Timetwo)')"
        print("sql2: \(sql2)")
        //通过封装的方法执行sql
        let result2 = db.execute(sql2)
        print(result2)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

