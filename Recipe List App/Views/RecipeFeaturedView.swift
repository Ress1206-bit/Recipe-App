////
////  RecipeFeaturedView.swift
////  Recipe List App
////
////  Created by Adam Ress on 6/9/23.
////
//
import SwiftUI

struct RecipeFeaturedView: View {
    @EnvironmentObject var model: RecipeModel
    @State var tabSelectionIndex = 0

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            VStack(alignment: .leading, spacing: 0){
                Text("Featured Recipes")
                    .padding(.leading)
                    .font(Font.custom("Avenir Heavy", size: 24))
                    .padding(.top, 40)
                    .bold()
            }
            
            GeometryReader { geo in
                TabView(selection: $tabSelectionIndex) {
                    ForEach(0..<model.recipes.count, id: \.self) { index in
                        if model.recipes[index].featured {
                            let recipe = model.recipes[index]
                            RecipeCard(recipe: recipe)
                                .tag(index)
                                .frame(width: geo.size.width - 40, height: geo.size.height - 100)
                                .cornerRadius(15)
                                .shadow(radius: 10, x: -5, y: 5)
                        }
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            }
            
            VStack(alignment: .leading, spacing: 10) {
                Text("Preparation Time:")
                    .font(Font.custom("Avenir Heavy", size: 16))
                Text(model.recipes[tabSelectionIndex].prepTime)
                    .font(Font.custom("Avenir", size: 15))
                Text("Highlights")
                    .font(Font.custom("Avenir Heavy", size: 16))
                RecipeHighlights(highlights: model.recipes[tabSelectionIndex].highlights)
            }
            .padding(.leading)
            .padding(.bottom)
        }
        .onAppear(perform: {
            firstFeaturedIndex()
        })
    }
    
    
    func firstFeaturedIndex() {
        //Find the first index of recipe that is featured
        var index = model.recipes.firstIndex { (recipe) -> Bool in
            return recipe.featured
        }
        tabSelectionIndex = index ?? 0
    }
}
