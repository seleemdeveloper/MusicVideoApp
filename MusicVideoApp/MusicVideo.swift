//
//  MusicVideo.swift
//  MusicVideoApp
//
//  Created by ahmed seleem on 4/27/16.
//  Copyright © 2016 ahmed seleem. All rights reserved.
//

import Foundation

class MusicVideo
{
    // Data encapsulated
    private var _vName: String
    private var _vImageURL: String
    private var _vVideoURL:String
    
    
    // make getter
    var vName: String
    {
     return _vName
    }
    
    var vImageURL: String
    {
     return _vImageURL
    }
    
    var vVideoURL: String
    {
     return _vVideoURL
    }
    
    
    
    // init MusicVideo Object
    
    init(data: JSONDict)
    {
     if let nameDict = data["im:name"] as? JSONDict ,let name = nameDict["label"] as? String
     {
      self._vName = name
     }
     else
     {
      self._vName = ""
     }
        
    if let imgDict = data["im:image"] as? JSONArray, let imageArr = imgDict[2] as? JSONDict,let image = imageArr["label"] as? String
    {
        self._vImageURL = image.stringByReplacingOccurrencesOfString("100x100", withString: "600x600")
    }
    else
    {
        self._vImageURL = ""
    }

    if let videoArr = data["link"] as? JSONArray, let videoDict = videoArr[1] as? JSONDict,let attributes = videoDict["attributes"] as? JSONDict,let videoURL = attributes["href"] as? String
    {
     self._vVideoURL = videoURL
    }
    else
    {
    self._vVideoURL = ""
    }
        
        
    }
    
    
    
    
    
    
}










