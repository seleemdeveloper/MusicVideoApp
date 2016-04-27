//
//  ViewController.swift
//  MusicVideoApp
//
//  Created by ahmed seleem on 4/26/16.
//  Copyright © 2016 ahmed seleem. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad()
    {
        super.viewDidLoad()
       
        
        //call API
        let api = APIManager()
        api.loadData("https://itunes.apple.com/eg/rss/topmusicvideos/limit=10/json",completion: didLoadData)
    }



 func didLoadData(result: String)
 {
  let alert = UIAlertController(title: result, message: nil, preferredStyle: .Alert)
  let okAction = UIAlertAction(title: "OK", style: .Default,handler: nil)
  alert.addAction(okAction)
  self.presentViewController(alert, animated: true, completion: nil)
 }

}