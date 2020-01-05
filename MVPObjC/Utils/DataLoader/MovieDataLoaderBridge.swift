//
//  MovieDataLoader.swift
//  MVPObjC
//
//  Created by Richard Moult on 5/1/20.
//  Copyright © 2020 RichardMoult. All rights reserved.
//

import Foundation

@objc public class AssetDataModel2: NSObject, Decodable {
    @objc let data: DataModel

    @objc class DataModel: NSObject, Decodable {
        @objc let items: [AssetItem]
    }

    @objc class AssetItem: NSObject, Decodable {
        @objc let id: String
        @objc let title: String
        @objc let image: Image

        @objc class Image: NSObject, Decodable {
            @objc let url: URL
        }
    }
}


@objc public class MovieDataLoaderBridge: NSObject {

    private let dataLoader = DataLoader<AssetDataModel2>(resource: "movies")

    @objc public override init() {}

    @objc public func load(onSuccess: @escaping (AssetDataModel2) -> Void,
              onError: @escaping (NSError) -> Void) {
        dataLoader.load { (result) in
            switch result {
            case .success(let data):
                onSuccess(data)
            case .failure(let error):
                onError(error as NSError)
            }
        }
    }
}
