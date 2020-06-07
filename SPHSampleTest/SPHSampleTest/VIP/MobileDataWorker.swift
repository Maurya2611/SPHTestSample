//
//  MobileDataWorker.swift
//  SPHSampleTest
//
//  Created by Chandresh on 7/6/20.
//  Copyright © 2020 Chandresh. All rights reserved.
//
import UIKit

class MobileDataWorker {
    func fetchMobileData(completion: @escaping (MobileDataModel.Data.Response?, Error?) -> ()) {
    guard let publicUrl = URL(string: BaseURLConstant.BaseURL + BaseURLConstant.UrlCollection.UserDetailUrl.UserPosts) else { return }
    URLSession.shared.dataTask(with: publicUrl) { (data, response
        , error) in
        guard let data = data else { return }
        do {
            let decoder = JSONDecoder()
            let publicData = try decoder.decode(MobileDataModel.Data.Response.self, from: data)
            completion(publicData,nil)
        } catch let err {
            completion(nil,err)
        }
        }.resume()
  }
}
