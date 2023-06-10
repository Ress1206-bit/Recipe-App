////
////  RecipeFeaturedView.swift
////  Recipe List App
////
////  Created by Adam Ress on 6/9/23.
////
//
import SwiftUI
//
//struct RecipeFeaturedView: View {
//
//    @EnvironmentObject var model:RecipeModel
//    @State var isDetailViewShowing = false
//
//    var body: some View {
//
//        VStack(alignment: .leading, spacing: 0){
//            Text("Featured Recipes")
//                .padding(.leading)
//                .font(.largeTitle)
//                .padding(.top, 40)
//                .bold()
//
//            GeometryReader{geo in
//                TabView {
//                    ForEach(0..<model.recipes.count, id: \.self){ index in
//                        if model.recipes[index].featured == true {
//                            //Recipe card button
//                            Button(action: {
//                                //Show recipe detal sheet
//                                print(index)
//                                print(model.recipes[index].name)
//                                self.isDetailViewShowing = true
//                            }, label: {
//                                ZStack{
//                                    Rectangle()
//                                        .foregroundColor(.white)
//                                    VStack(spacing: 0) {
//                                        Image(model.recipes[index].image)
//                                            .resizable()
//                                            .aspectRatio(contentMode: .fill)
//                                            .clipped()
//                                        Text(model.recipes[index].name)
//                                            .padding(5)
//                                    }
//                                }
//                            })
//                            .sheet(isPresented: $isDetailViewShowing) {
//                                //Show the recipt detail view
//                                RecipeDetailView(recipe: model.recipes[index])
//
//                            }
//                            .buttonStyle(PlainButtonStyle())
//                            .frame(width: geo.size.width-40, height: geo.size.height - 100, alignment: .center)
//                            .cornerRadius(15)
//                            .shadow(radius: 10, x: -5, y: 5)
//                        }
//                    }
//                }
//                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
//                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
//            }
//
//            VStack(alignment: .leading, spacing: 10) {
//                Text("Preparation Time:")
//                    .font(.headline)
//                Text("1 hour")
//                Text("Highlights")
//                    .font(.headline)
//                Text("Healthy, Hearty")
//            }
//            .padding(.leading)
//            .padding(.bottom)
//
//        }
//    }
//}
//
//struct RecipeFeaturedView_Previews: PreviewProvider {
//    static var previews: some View {
//        RecipeFeaturedView()
//            .environmentObject(RecipeModel())
//    }
//}

struct RecipeFeaturedView: View {
    @EnvironmentObject var model: RecipeModel

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            VStack(alignment: .leading, spacing: 0){
                Text("Featured Recipes")
                    .padding(.leading)
                    .font(.largeTitle)
                    .padding(.top, 40)
                    .bold()
            }
            
            GeometryReader { geo in
                TabView {
                    ForEach(0..<model.recipes.count, id: \.self) { index in
                        if model.recipes[index].featured {
                            let recipe = model.recipes[index]
                            RecipeCard(recipe: recipe)
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
                    .font(.headline)
                Text("1 hour")
                Text("Highlights")
                    .font(.headline)
                Text("Healthy, Hearty")
            }
            .padding(.leading)
            .padding(.bottom)
        }
    }
}
