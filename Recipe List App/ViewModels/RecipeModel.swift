//
//  RecipeModel.swift
//  Recipe List App
//
//  Created by Adam Ress on 6/9/23.
//

import Foundation

class RecipeModel: ObservableObject {
    
    @Published var recipes = [Recipe]()
    
    init(){
        // Creates an instance of data service and get the data
        self.recipes = DataService.getLocalData()
        
        // Set the recipes property
    }
}
