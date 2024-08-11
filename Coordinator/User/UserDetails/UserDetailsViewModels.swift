//
//  UserDetailsViewModels.swift
//  Coordinator
//
//  Created by Tharindu Ketipearachchi on 2023-04-24.
//

import Foundation
import Combine

final class UserDetailsViewModel: ObservableObject {
    
    @Published var profile: Profile?
    
    private var userID: Int
    private var repository: UserDetailRepositoryProtocol
    private var cancellables = Set<AnyCancellable>()
    
    init(userID: Int, repository: UserDetailRepositoryProtocol) {
        self.userID = userID
        self.repository = repository
    }
    
    func fetchProfile() {
        repository.fetchProfile()
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    print("Finished fetching profiles.")
                case .failure(let error):
                    print("Error fetching profiles: \(error)")
                }
            }, receiveValue: { profiles in
                print("Received profiles: \(profiles)")
                guard let profile = profiles.first else { return }
                self.profile = profile
            })
            .store(in: &cancellables)
    }
}
