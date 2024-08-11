//
//  PokemonLocalDataSource.swift
//  Practice-UI
//
//  Created by Chawatvish Worrapoj on 3/8/2567 BE.
//

import Foundation
import Combine

protocol PokemonLocalDataSourceProtocol {
    
}

struct PokemonLocalDataSource: PokemonLocalDataSourceProtocol {
    func fetchPokemon() -> AnyPublisher<[PokemonEntities], any Error> {
        guard let url = URL(string: "https://tyradex.vercel.app/api/v1/pokemon") else {
            return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
          }
        let jsonDecoder = JSONDecoder()
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: [PokemonData].self, decoder: jsonDecoder)
            .map { pokemonArray in
                return pokemonArray.map { $0.toEntity() }
            }
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
}
