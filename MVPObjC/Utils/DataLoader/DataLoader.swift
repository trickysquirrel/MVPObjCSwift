//
//  AssetDataLoader.swift
//  MVPObjC
//
//  Created by Richard Moult on 5/1/20.
//  Copyright © 2020 RichardMoult. All rights reserved.
//

import Foundation

struct DataLoader<T> where T: Decodable {

    private let resource: String

    init(resource: String) {
        self.resource = resource
    }

    func load(completion: @escaping (Result<T, Error>) -> Void) {

        let generalError = NSError(domain: "Could not load data from resource file", code: 0, userInfo: nil)
        guard let location = Bundle.main.path(forResource: resource, ofType: "json") else {
            completion(.failure(generalError))
            return
        }

        let resourceUrl = URL(fileURLWithPath: location)

        guard
            let data = try? Data(contentsOf: resourceUrl),
            let dataModel = try? JSONDecoder().decode(T.self, from: data) else {
                completion(.failure(generalError))
                return
        }

        // adding in a delay before responding to simulate network delays
        let when = DispatchTime.now() + 1
        DispatchQueue.main.asyncAfter(deadline: when) {
            completion(.success(dataModel))
        }
    }
}
