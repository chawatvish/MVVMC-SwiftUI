//
//  PokemonRepository.swift
//  Practice-UI
//
//  Created by Chawatvish Worrapoj on 3/8/2567 BE.
//

import Foundation
import Combine

protocol PokemonRepositoryProtocol {
    func fetchPokemon() -> AnyPublisher<[PokemonEntities], any Error>
}

struct PokemonRepository: PokemonRepositoryProtocol {
    
    let remoteDataSource : PokemonRemoteDataSourceProtocol
    let LocalDataSource : PokemonLocalDataSourceProtocol
    
    init(remoteDataSource: PokemonRemoteDataSourceProtocol,
         LocalDataSource : PokemonLocalDataSourceProtocol) {
        self.remoteDataSource = remoteDataSource
        self.LocalDataSource = LocalDataSource
    }
    
    func fetchPokemon() -> AnyPublisher<[PokemonEntities], any Error> {
        remoteDataSource.fetchPokemon()
    }
}
