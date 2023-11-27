//
//  SearchBar.swift
//  Lynnime
//
//  Created by Akito Daiki on 17/11/2566 BE.
//

import SwiftUI

struct SearchBar: View {
    @Binding var searchText: String
    
    var body: some View {
        HStack {
            TextField("Search", text: $searchText)
                .padding(8)
                .background(Color(.systemGray5))
                .cornerRadius(8)
            
            Button(action: {
                searchText = ""
            }) {
                Image(systemName: "xmark.circle.fill")
                    .foregroundColor(.gray)
                    .padding(8)
            }
            .opacity(searchText.isEmpty ? 0 : 1)
        }
        .padding(.horizontal)
    }
}

#Preview {
    SearchBar(searchText: .constant("Nigga"))
}
