//
//  PokemonLocalDataSource.swift
//  Practice-UI
//
//  Created by Chawatvish Worrapoj on 3/8/2567 BE.
//

import Foundation
import Combine

protocol UserDetailLocalDataSourceProtocol {
    func fetchLocalProfile() -> [Profile]
}

struct UserDetailLocalDataSource: UserDetailLocalDataSourceProtocol {
    func fetchLocalProfile() -> [Profile] {
        return [
            Profile(id: 05,
                    name: "Jone Doe",
                    age: 25,
                    occupation: "Doctor")
        ]
    }
}
