////
////  DetailView.swift
////  Lynnime
////
////  Created by Akito Daiki on 17/11/2566 BE.
////
////
//
//import SwiftUI
//import Kingfisher
//struct DetailView: View {
//    @ObservedObject var viewModel = Api()
//    @State private var selectedAnime: Anime?
//    @State private var searchText = ""
//    var filteredAnime: [Anime] {
//        if searchText.isEmpty {
//            return viewModel.animes
//        } else {
//            return viewModel.animes.filter { $0.genre.localizedCaseInsensitiveContains(searchText)
//            }
//        }
//    }
//    var groupedAnime: [String: [Anime]] {
//        Dictionary(grouping: filteredAnime) { $0.title.capitalized }
//    }
//    var body: some View {
//        VStack{
//            SearchBar(searchText: $searchText)
//            List {
//                ForEach(groupedAnime.keys.sorted(), id: \.self) { type in
//                    Section(header: Text(type)) {
//                        ForEach(groupedAnime[type]!, id: \.id) { anime in
//                            Button(action: {
//                                selectedAnime = anime
//                            }) {
//                                HStack {
//                                    KFImage(URL(string: anime.imageUrl))
//                                        .resizable()
//                                        .frame(width: 50, height: 50)
//                                        .cornerRadius(8)
//                                    
//                                    VStack(alignment: .leading) {
//                                        Text(anime.members.capitalized)
//                                            .font(.headline)
//                                        Text(anime.title.capitalized)
//                                            .font(.subheadline)
//                                            .foregroundColor(.gray)
//                                    }
//                                }
//                                .padding(.vertical, 8)
//                            }
//                        }
//                    }
//                }
//            }
//            .listStyle(InsetGroupedListStyle())
//            .zIndex(-1)
//            .sheet(item: $selectedAnime) { anime in
//                AnimeDetailView(viewModel: viewModel, anime: anime)
//            }
//        }
//    }
//}
//
//#Preview {
//    DetailView()
//}
