//
//  bate.swift
//  counter
//
//  Created by 20131105804 on 16/6/22.
//  Copyright © 2016年 计分器. All rights reserved.
//

import UIKit

class bate: UIViewController {

    var db : SQLiteDB!
    
    @IBOutlet weak var record: UITextView!

    @IBAction func find(sender: UIButton) {
         initUser()
    }
    func initUser() {
        let data = db.query("select * from t_user")
        let data1 = db.query("select * from t_mark")
        let data2 = db.query("select * from t_time")
        //if data.count > 0
        for var a=0;a<data.count;a++
        {
            //获取最后一行数据显示  可能值？ 确定有！
            let user = data[a]
            record.text! += "农大校队：" + (user["agronomy"] as? String)! + "\n" + "师大校队：" +  (user["teach"] as? String)! + "\n"
            if data1.count > 0 {
                let user = data1[a]
                record.text! += "农大校队分数：" + (user["agrscore"] as? String)!  + "\n" + "师大校队分数：" +  (user["teascore"] as? String)! + "\n"
            }
            if data2.count > 0 {
                let user = data2[a]
                record.text! += "时间" + (user["min"] as? String)! + " : " + (user["sec"] as? String)! + "\n"
            }
            
        }
    }
   
  
    override func viewDidLoad() {
        super.viewDidLoad()
        //获取数据库实例
        db = SQLiteDB.sharedInstance()
        //如果表还不存在则创建表（其中uid为自增主键）
        db.execute("create table if not exists t_user(uid integer primary key,agronomy varchar(20),teach varchar(20))")
        //如果有数据则加载
        
        
        db = SQLiteDB.sharedInstance()
        db.execute("create table if not exists t_mark(uid integer primary key,agrscore varchar(20),teascore varchar(20))")
        //

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
