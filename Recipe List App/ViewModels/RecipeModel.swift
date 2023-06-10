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
    
    static func getPortion(ingredient: Ingredient, recipeServings: Int, targetServings: Int) -> String {
        
        var portion = ""
        var numerator = ingredient.num ?? 1
        var denominator = ingredient.denom ?? 1
        var wholePortions = 0
        
        if ingredient.num != nil {
            
            //Get a single serving size by multiplying denomnator by recipe serving
            denominator *= recipeServings
            
            //Get target portion by multiplying numerator by target servings
            numerator *= targetServings
            
            //Reduce fraction by greatest common divisor
            let divisor = Rational.greatestCommonDivisor(numerator, denominator)
            numerator /= divisor
            denominator /= divisor
            
            //Get the whole number if numertator > denominator
            if numerator >= denominator {
                wholePortions = numerator/denominator
                numerator %= denominator
                
                //Assign to portion string
                portion += String(wholePortions)
            }
            
            // Express remainder as fractions
            if numerator > 0 {
                
                //Assign remainder as fraction to the portion string
                portion += wholePortions > 0 ? " " : ""
                portion += "\(numerator)/\(denominator)"
            }
            
        }
        
        if var unit = ingredient.unit {
            //Calculate appropriate suffix
            if wholePortions > 1 {
                if unit.suffix(2) == "ch" {
                    unit += "es"
                }
                else if unit.suffix(1) == "f" {
                    unit = String(unit.dropLast())
                    unit += "ves"
                }
                else {
                    unit += "s"
                }
            }
            
            portion += ingredient.num == nil && ingredient.denom == nil ? "" : " "
            
            return portion + unit
        }
        
        return portion
    }
}
