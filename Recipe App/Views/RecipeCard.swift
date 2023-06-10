//
//  RecipeCard.swift
//  Recipe List App
//
//  Created by Adam Ress on 6/10/23.
//

import SwiftUI

struct RecipeCard: View {
    @State private var isDetailViewShowing = false
    let recipe: Recipe

    var body: some View {
        Button(action: {
            isDetailViewShowing = true
        }) {
            ZStack {
                Rectangle()
                    .foregroundColor(.white)
                VStack(spacing: 0) {
                    Image(recipe.image)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .clipped()
                    Text(recipe.name)
                        .font(Font.custom("Avenir", size: 15))
                        .padding(5)
                }
            }
        }
        .sheet(isPresented: $isDetailViewShowing) {
            RecipeDetailView(recipe: recipe)
        }
        .buttonStyle(PlainButtonStyle())
    }
}
