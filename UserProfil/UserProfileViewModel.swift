//
//  UserViewModel.swift
//  Jobiz
//
//  Created by Developer on 25.06.24.
//

import Foundation

class UserProfileViewModel {
    private var userProfile: UserProfile
    
    init(userProfile: UserProfile) {
        self.userProfile = userProfile
    }
    
        var name: String {
            return userProfile.name
        }
    
        var jobTitle: String {
            return userProfile.jobTitle
        }
    
        var appliedCount: String {
            return "\(userProfile.appliedCount)"
        }
    
        var reviewedCount: String {
            return "\(userProfile.reviewedCount)"
        }
    
        var interviewCount: String {
            return "\(userProfile.interviewCount)"
        }
    
        var resumeDescription: String {
            return userProfile.resumeDescription
        }
    
        var portfolioImages: [String] {
            return userProfile.portfolioImages
        }
    }
    

