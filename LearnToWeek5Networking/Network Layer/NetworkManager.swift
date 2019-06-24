//
//  NetworkManager.swift
//  LearnToWeek5Networking
//
//  Created by Kris Jones on 16/06/2019.
//  Copyright © 2019 Kris Jones. All rights reserved.
//

import Foundation
import Alamofire


class NetworkManager {

  let baseUrl: String

  init(baseUrl: String) {
    self.baseUrl = baseUrl
  }

  func get(path: String, completion: @escaping (Array<Any>?) -> ()) {

    let urlToGet = URL(string: "\(baseUrl)\(path)")

    Alamofire.request(urlToGet!, method: .get).responseJSON { (response) in
      completion(response.value! as? Array<Any>)
    }

  }


  func post(path: String, parameters:[String: Any], completion: @escaping([String: AnyObject]?) -> () ) {

    let urlToPost = URL(string: "\(baseUrl)\(path)")

    Alamofire.request(urlToPost!, method: .post, parameters: parameters, encoding: JSONEncoding.default ).responseJSON { (response) in

      completion(response.value! as? [String : AnyObject])

    }

  }

}
