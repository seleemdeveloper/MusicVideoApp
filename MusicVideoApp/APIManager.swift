//
//  APIManager.swift
//  MusicVideoApp
//
//  Created by ahmed seleem on 4/26/16.
//  Copyright © 2016 ahmed seleem. All rights reserved.
//

import Foundation

class APIManager
{
   
    
    func loadData(urlString: String,completion: (result:String) -> Void )
    {
     
        let sessionConfig = NSURLSessionConfiguration.ephemeralSessionConfiguration()
        let session = NSURLSession(configuration: sessionConfig)
        
        let url = NSURL(string: urlString)!
        let task = session.dataTaskWithURL(url)
        {
         (data, response, error) in
         
            
             if error != nil
             {
              dispatch_async(dispatch_get_main_queue())
              {
              completion(result: error!.localizedDescription)
              }
             }
             else
             {
             
                do
                {
                    if let json = try NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments) as? JSONDict
                    {
                     print(json)
                    }
                }
                catch
                {
                 dispatch_async(dispatch_get_main_queue())
                 {
                  completion(result: "error in JSONSerialization")
                 }
                }
                
             }
            
        }
        task.resume()
    }
    
    
}