//
//  ContentView.swift
//  Lynnime
//
//  Created by Akito Daiki on 14/11/2566 BE.
//

import SwiftUI
import Kingfisher

//https://loremflickr.com/640/360
struct ContentView: View {
    
    @ObservedObject var viewModel = Api()
    @State private var searchText = ""
    @State private var selectedAnime: Anime? = nil
    
    private var searchedAnime: [Anime] {
        if searchText.isEmpty{
            return viewModel.animes
        } else {
            return viewModel.animes.filter{ anime in
                return anime.title.localizedCaseInsensitiveContains(searchText)
            }
        }
    }
    
    var body: some View {
        VStack{
            NavigationView{
                if(viewModel.animes.isEmpty){
                    Text("Loading ... ")
                }else{
                    VStack{
                        SearchBar(searchText: $searchText)
                        List(searchedAnime){ anime in
                            NavigationLink(destination: DetailView(anime: anime), tag: anime, selection: $selectedAnime){ //need view this line
                                HStack(spacing: 30){
                                    AsyncImage(url: URL(string: anime.img_url) ?? URL(string: "http://www.domain.com/path/to/image.jpg")!){ image in
                                        image
                                            .resizable()
                                            .scaledToFit()
                                    }placeholder: {
                                        Color.gray.opacity(0.3)
                                    }
                                    .frame(width: 100, height: 50)
                                }
                                VStack(alignment: .leading){
                                    Text("\(anime.title)").bold().lineLimit(1)
                                }
                            }
                        }.onAppear()
                    }
                }
            }
        }
    }
}

//DetailView(anime: animes), tag: animes, selection: $searchText

struct DetailView: View {
    let anime: Anime
    
    var body: some View {
        KFImage(URL(string: anime.img_url))
            .resizable()
            .scaledToFit()
            .frame(width: 250, height: 250, alignment: .center)
            .padding()
            .padding(.leading, 20)
        
        
        Form{
            
            Text("\(anime.title)")
                .font(.title3)
                .bold()
                .foregroundColor(Color.red)
                .multilineTextAlignment(.center)
            HStack{
                Text("Genre : ").font(.title3).bold()
                Text(anime.genre)
            }
            HStack{
                Text("Popularity : ").font(.title3).bold()
                Text("\(anime.popularity)")
            }
            HStack{
                Text("Ranked : ").font(.title3).bold()
                Text("\(anime.ranked)")
            }
            HStack{
                Text("Score : ").font(.title3).bold()
                let formattedData = String(format: "%.1f", anime.score)
                Text("\(formattedData)")
            }
            NavigationLink(destination: Text(anime.synopsis)){
                Text("More Details").font(.title3).foregroundColor(Color.blue)
            }
            Button{
                
            }label: {
                RoundedRectangle(cornerRadius: 10)
                    .background(Color.blue)
                Text("Add to Watchlist")
                    .foregroundColor(Color.white)
                    .bold()
            }
        }
    }
}


#Preview {
    ContentView()
}
