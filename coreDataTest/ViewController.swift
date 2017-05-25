//
//  ViewController.swift
//  coreDataTest
//
//  Created by 黃毓皓 on 2017/5/8.
//  Copyright © 2017年 ice elson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appDel =  UIApplication.shared.delegate as? AppDelegate
        guard let context  = appDel?.persistentContainer.viewContext else {
           return
        }
//        let aUser = User(context: context)
//        aUser.username = "elson"
//        aUser.password = "123456"
//        appDel?.saveContext()
        
        
//        do {
//            let results = try context.fetch(User.fetchRequest())
//            let testUser = results[0] as? User
//            testUser?.password = "testPassword"
//            appDel?.saveContext()
//        } catch  {
//            
//        }
        
        do {
           let results = try context.fetch(User.fetchRequest())
            for item in results{
                guard let nowUser = item as? User else{return
                }
              
                if nowUser.username == "elson"{
                    context.delete(nowUser)
                    appDel?.saveContext()
                }
                
            }
        } catch  {
            
        }
        
        
                do {
                   let results = try context.fetch(User.fetchRequest())
                    for item in results{
                  let nowUser =   item as? User
                   print("\(nowUser?.username)")
                print("\(nowUser?.password)")
                    }
                } catch  {
                    
                }
    
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

