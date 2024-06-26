//
//  HomeViewModel.swift
//  Jobiz
//
//  Created by Developer on 24.06.24.
//


import Foundation
import UIKit

class JobViewModel {
    private var featuredJobs: [Job] = [
        Job(title: "Product Designer", company: "Google", location: "California, USA", salary: "$160,000/year"),
        Job(title: "UX Designer", company: "Dribbble", location: "Remote", salary: "$80,000/year")
    ]
    
    private var recommendedJobs: [Job] = [
        Job(title: "Sr Engineer", company: "Facebook", location: "Remote", salary: "$96,000/year"),
        Job(title: "Backend Developer", company: "Amazon", location: "New York, USA", salary: "$120,000/year")
    ]
    
    var numberOfFeaturedJobs: Int {
        return featuredJobs.count
    }
    
    var numberOfRecommendedJobs: Int {
        return recommendedJobs.count
    }
    
    func featuredJob(at index: Int) -> Job {
        return featuredJobs[index]
    }
    
    func recommendedJob(at index: Int) -> Job {
        return recommendedJobs[index]
    }
}

