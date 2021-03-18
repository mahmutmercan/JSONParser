//
//  ViewController.swift
//  JSONparser
//
//  Created by Mahmut MERCAN on 16.03.2021.
//

import UIKit

struct Course: Decodable {
    let id: Int
    let name: String
    let link: String
    let imageUrl: String
}


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let jsonUrlString = "https://api.letsbuildthatapp.com/jsondecodable/courses"
        guard let url = URL(string: jsonUrlString) else
        { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            
            guard let data = data else { return }
            
//            let dataAsString = String(data: data, encoding: .utf8)
//            print(dataAsString)
            
            do {
                let courses = try JSONDecoder().decode([Course].self, from: data)
                print(courses)
            } catch let jsonErr {
                print("Error serializing json:", jsonErr)
            }
            
            
        }.resume()
        
//        let myCourse = Course(id: 1, name: "my course", link: "some link", imageUrl: "some image url")
//        print(myCourse)
    }
}

