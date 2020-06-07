//
//  BaseURLConstant.swift
//  SPHSampleTest
//
//  Created by Chandresh on 6/6/20.
//  Copyright © 2020 Chandresh. All rights reserved.
//

import Foundation
struct BaseURLConstant {
    private struct Domains {
        static let Dev = "https://data.gov.sg"
    }
    
    private  struct Routes {
        static let Api = "/api/action"
    }
    struct UrlCollection {
        struct UserDetailUrl {
            static let UserPosts = "/datastore_search?resource_id=a807b7ab-6cad-4aa6-87d0-e283a7353a0f"
        }
    }
    
    private  static let Route = Routes.Api
    static let BaseURL = Domains.Dev + Route
    static let BaseRootUrl = Domains.Dev
}
