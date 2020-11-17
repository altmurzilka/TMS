//
//  ViewController.swift
//  ProjectAPI
//
//  Created by Алтын on 11/17/20.
//

import UIKit

struct Employees: Decodable {
    var status: String
    var data: [EmployeeData]
}

struct EmployeeData: Decodable {
    var id: String?
    var employee_name: String?
    var employee_salary: String?
    var employee_age: String?
    var profile_image: String?
}

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sendRequest()
    }
    
    func sendRequest() {
        guard let url = URL(string: "http://dummy.restapiexample.com/api/v1/employees") else {
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if error == nil, let data = data {
                do {
                    let employeeData = try JSONDecoder().decode(Employees.self, from: data)
                    print(employeeData)
                    //                    let websiteDescription = try JSONDecoder().decode(Employees.self, from: data)
                    //                    print(websiteDescription.data)
                } catch {
                    print(error)
                }
            }
        }
        task.resume()
    }
}

