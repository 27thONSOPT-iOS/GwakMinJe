//
//  AuthService.swift
//  SOPTSeminar6
//
//  Created by 곽기곤's Mac on 2020/11/21.
//

import Foundation
import Alamofire

struct AuthService {
    
    static let shared = AuthService()
    
    func signUp(uEmail: String, uPassword: String, userName: String, completion: @escaping(NetworkResult<Any>) -> ()) {
        
        let uUrl = APIConstants.usersSignInURL
        
        let uHeader: HTTPHeaders = [
            
            "Content-Type": "application/json"
        ]
        
        let uBody: Parameters = [
            
        "email": uEmail,
        "password":uPassword,
            "userName":userName
        ]
        
        let uDataRequest = AF.request(uUrl, method: .post, parameters: uBody, encoding: JSONEncoding.default, headers: uHeader)
        
        uDataRequest.responseData { (uResponse) in
            
            switch uResponse.result {
            case .success:
            guard let statusCode = uResponse.response?.statusCode else {
            return
            }
            guard let uData = uResponse.value else {
            return
            }
            completion(judgeSignInData(status: statusCode, data: uData))
            case .failure(let err):
            print(err)
            completion(.networkFail)
            }
            
            
        }
    }
    
    private func judgeSignInData(status: Int, data: Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(GenericResponse<DataClass>.self, from: data) else {
            return .pathErr
    }
        switch status {
            case 200:
                return .success(decodedData.data as Any)
        case 400..<500:
            return .requestErr(decodedData.message)
        case 500:
            return .serverErr
        default:
            return .networkFail
    }
    }
    
    func signIn(email: String, password: String, completion: @escaping(NetworkResult<Any>) -> ()) {
        
        let url = APIConstants.usersSignInURL
        
        let header: HTTPHeaders = [
            
            "Content-Type" : "application/json"
        ]
        
        let body: Parameters = [
            
            "email": email,
            "password": password
        ]
        
        let dataRequest = AF.request(url, method: .post, parameters: body, encoding: JSONEncoding.default, headers: header)
        
        dataRequest.responseData { (response) in
            
            switch response.result {
            
            case .success:
                guard let statusCode = response.response?.statusCode else {
                    
                    return
                }
                guard let data = response.value else {
                    
                    return
                }
                completion(judgeSignInData(status: statusCode, data: data))
                
            case.failure(let err):
                print(err)
                completion(.networkFail)
            }
        }
    }
    
//    private func judgeSignInData(status: Int, data: Data) -> NetworkResult<Any> {
//        
//        let decoder = JSONDecoder()
//        
//        guard let decodedData = try?decoder.decode(GenericResponse<SigninData>.self, from: data) else {
//            
//            return .pathErr
//        }
//        
//        switch status {
//        case 200:
//            return .success(decodedData.data)
//            
//        case 400:
//            return .requestErr(decodedData.message)
//            
//        case 500:
//            return .serverErr
//            
//        default:
//            return .pathErr
//        }
//    }
}
