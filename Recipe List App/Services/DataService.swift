//
//  DataService.swift
//  Recipe List App
//
//  Created by Adam Ress on 6/9/23.
//

import Foundation

class DataService {
    
    static func getLocalData() -> [Recipe] {
        
        //Parse local json file
        
        //Get a url path to json file
        let pathString = Bundle.main.path(forResource: "recipes", ofType: "json")
        
        //Check pathString does not equal nil otherwise
        guard pathString != nil else {
            return [Recipe]()
        }
        
        //Create a url object
        let url = URL(filePath: pathString!)
        
        do {
            //Create a data object
            let data = try Data(contentsOf: url)
            
            //Decode the data with a JSON decoder
            let decoder = JSONDecoder()
            
            do {
                let recipeData = try decoder.decode([Recipe].self, from: data)
                
                //Add the unique IDs
                for r in recipeData {
                    r.id = UUID()
                }
                
                //Return the recipes
                return recipeData
                
            } catch {
                print(error)
            }
        }
        catch {
            print(error)
        }
        
        return [Recipe]()
    }
}
