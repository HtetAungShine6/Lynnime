//
//  Api.swift
//  Lynnime
//
//  Created by Akito Daiki on 14/11/2566 BE.
//

import Foundation

class Api: ObservableObject{
    @Published var animes = [Anime]()
    let baseURL = "https://lynnime-web02.vercel.app/api/anime0"
    
    init(){
        fetchData()
    }
    
    func fetchData(){
        let decoder = JSONDecoder()
        guard let url = URL(string: baseURL) else {return}
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let animes = try? decoder.decode([Anime].self, from: data!) else {return}
            DispatchQueue.main.async {
                self.animes = animes
            }
        }.resume()
    }
}
