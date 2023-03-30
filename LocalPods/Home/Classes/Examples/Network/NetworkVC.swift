//
//  NetworkVC.swift
//  Home
//
//  Created by zitao0206 on 2023/3/20.
//

import Foundation

struct Todo: Codable {
    let userId: Int
    let id: Int
    let title: String
    let completed: Bool
}


class NetworkVC : UIViewController {
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        commonRequestOfURLSession()
        
        view.backgroundColor = .white
        
    }
    
    func commonRequestOfURLSession() {
        let url = NSURL(string: "https://jsonplaceholder.typicode.com/todos/1")!

        let task = URLSession.shared.dataTask(with: url as URL) { data, response, error in
            guard let data = data else {
                print("Error: No data was returned from server.")
                return
            }
            
            do {
                let todo = try JSONDecoder().decode(Todo.self, from: data)
                print("Todo: \(todo.title)")
            } catch {
                print("Error decoding JSON: \(error.localizedDescription)")
            }
        }

        task.resume()
    }
}
