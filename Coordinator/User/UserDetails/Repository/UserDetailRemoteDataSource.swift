import Foundation
import Combine

protocol UserDetailRemoteDataSourceProtocol {
    func fetchProfile() -> AnyPublisher<[Profile], any Error>
}

struct UserDetailRemoteDataSource: UserDetailRemoteDataSourceProtocol {
    func fetchProfile() -> AnyPublisher<[Profile], any Error> {
        return Future<[Profile], Error> { promise in
            DispatchQueue.global().asyncAfter(deadline: .now() + 3) {
                promise(.success([Profile(id: 05,
                                          name: "Jone Doe",
                                          age: 25,
                                          occupation: "Doctor")]))
            }
        }
        .eraseToAnyPublisher()
        
//        guard let url = URL(string: "https://tyradex.vercel.app/api/v1/pokemon") else {
//            return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
//          }
//        let jsonDecoder = JSONDecoder()
//        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
//        
//        return URLSession.shared.dataTaskPublisher(for: url)
//            .map(\.data)
//            .decode(type: [PokemonData].self, decoder: jsonDecoder)
//            .map { pokemonArray in
//                return pokemonArray.map { $0.toEntity() }
//            }
//            .receive(on: RunLoop.main)
//            .eraseToAnyPublisher()
    }
}
