//
//  TypeErasure00.swift
//  Programming
//
//  Created by zitao0206 on 2023/2/23.
//

import Foundation

/*
    Type Erasure应用之一：封装复杂的内部实现
 */

/*
 我们可以定义一个协议 ImageFetching，它具有一个名为 fetchImage 的方法：
 */
protocol ImageFetching {
    func fetchImage(completion: @escaping (UIImage?) -> Void)
}

/*
 复杂类型的对象 RealImageFetcher，它实现了 ImageFetching 协议，并提供了一个具有复杂实现的 fetchImage 方法。
 */
class RealImageFetcher: ImageFetching {
    private let urlSession: URLSession
    
    init(urlSession: URLSession = .shared) {
        self.urlSession = urlSession
    }
    
    func fetchImage(completion: @escaping (UIImage?) -> Void) {
        guard let url = URL(string: "https://img0.baidu.com/it/u=510612159,1569583884&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=416") else {
            completion(nil)
            return
        }
        
        let task = urlSession.dataTask(with: url) { data, response, error in
            guard error == nil else {
                completion(nil)
                return
            }
            
            guard let data = data, let image = UIImage(data: data) else {
                completion(nil)
                return
            }
            
            completion(image)
        }
        
        task.resume()
    }
}

/*
 接下来，我们可以创建一个简单的对象 AnyImageFetcher，它包装了 RealImageFetcher，并提供了一个简单的 fetchImage 方法：
 */
class AnyImageFetcher: ImageFetching {
    private let realFetcher: RealImageFetcher
    
    init(realFetcher: RealImageFetcher) {
        self.realFetcher = realFetcher
    }
    
    func fetchImage(completion: @escaping (UIImage?) -> Void) {
        realFetcher.fetchImage(completion: completion)
    }
}

class TypeErasure00 : CommonOpsProtocol {
    
    func testCase() {
        
        /* 现在，我们可以在其他代码中使用 AnyImageFetcher，而不需要知道具体的实现细节*/
        let imageFetcher: ImageFetching = AnyImageFetcher(realFetcher: RealImageFetcher())
        imageFetcher.fetchImage { image in
            // 处理图片
            
        }
    }
}
 

