//
//  BreedListView.swift
//  TestCo
//
//  Created by Laddy Carolina Diaz Lamus on 23/10/20.
//

import SwiftUI

struct BreedListView: View {
    @ObservedObject var breedVM = BreedListViewModel.shared

    
    var body: some View {
        VStack{
            Text("Hello, World!")
            SectionSpacerView(text: "List of Breeds")
                .padding(.top, 30)
            VStack {
                ListPageView(values: self.$breedVM.breeds,
                             isLoading: $breedVM.isLoading,
                             nextPage: {self.commentsVM.getCommentsByPage()}) { comment in
                                CommentCellView(comment: comment)
                }
            }
//            List (self.breedVM.breeds) { breed in
//                Text(breed.name)
//                    .padding(.vertical)
////                .frame(height: self.cellSize)
//            }
            Spacer()
        }.onAppear{
            breedVM.breedsList {
                
            } failure: {
                
            }

        }
    }
}

struct BreedListView_Previews: PreviewProvider {
    static var previews: some View {
        BreedListView()
    }
}
