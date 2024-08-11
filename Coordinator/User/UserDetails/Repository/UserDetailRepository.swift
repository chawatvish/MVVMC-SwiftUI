import Foundation
import Combine

protocol UserDetailRepositoryProtocol {
    func fetchProfile() -> AnyPublisher<[Profile], any Error>
}

struct UserDetailRepository: UserDetailRepositoryProtocol {
    
    let remoteDataSource: UserDetailRemoteDataSourceProtocol
    let localDataSource: UserDetailLocalDataSourceProtocol
    
    init(remoteDataSource: UserDetailRemoteDataSourceProtocol,
         localDataSource : UserDetailLocalDataSourceProtocol) {
        self.remoteDataSource = remoteDataSource
        self.localDataSource = localDataSource
    }
    
    func fetchProfile() -> AnyPublisher<[Profile], any Error> {
        remoteDataSource.fetchProfile()
    }
}

extension UserDetailRepository {
    static var `default`: UserDetailRepository {
        UserDetailRepository(remoteDataSource: UserDetailRemoteDataSource(),
                             localDataSource: UserDetailLocalDataSource())
    }
}
