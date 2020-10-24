//
//  BreedListViewModel.swift
//  TestCo
//
//  Created by Laddy Carolina Diaz Lamus on 23/10/20.
//

import Foundation
import SwiftUI
import Firebase

class BreedListViewModel: ObservableObject {
    static let shared = BreedListViewModel()
    
//    private let time = Time.shared
    let defaults = DefaultsConfig.shared
    let keychain = KeychainConfig.shared
    
    var repository = BreedListRepository.shared
    private var nextPage: String?


    @Published var breeds: [BreedModel] = []
    @Published var isLoading: Bool = false

    
    func breedsList(success: @escaping () -> Void,
                  failure: @escaping () -> Void) {

        repository.breeds { data in
            DispatchQueue.main.async { 
                self.breeds = data
                self.isLoading = true
            }
            print("sata.. \(data)")
            
        } failure: { message in
            self.isLoading = false
            print("error.. \(message)")

        }
    }
    
    func getBreedsByPage()  {
        if nextPage != nil {
            repository.breeds(page: nextPage, 
                              success: commentsPage in {
                              self.breeds.append(contentsOf: commentsPage)
                                self.nextPage = commentsPage.next
                                self.isLoading = false
                              }, failure: {

                              })
//            commentRepository.comments(serviceId: service.id,
//                                       contractorId: contractor.id,
//                                       page: nextPage,
//                                       success: { commentsPage in
//                                        self.comments.append(contentsOf: commentsPage.comments)
//                                        self.nextPage = commentsPage.next
//                                        self.isLoading = false
//            }) { error in
//                 self.isLoading = false
//            }
        } else {
            self.isLoading = false
        }
    }

//        repository.recovery(nickname: self.nickname.lowercased(),
//                            success: { data in
//                                DispatchSyncMainThreadSafe {
//                                    self.clean()
//                                    self.answersToSend = []
//                                    self.userType = data.userType
//                                    self.returnQuestions = data.question
//                                    self.returnQuestionsTemp = data.question
//                                    self.currentQuestionsInitial()
//                                    success()
//                                }
//        }) { message in
//            DispatchSyncMainThreadSafe {
//                self.titleMessage.0 = "TEXT_ALERT_FAILURE".localized
//                self.failMessage = message
//                self.showAlert = true
//                failure()
//            }
//        }
//    }
    
}
