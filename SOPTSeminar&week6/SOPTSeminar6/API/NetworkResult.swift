//
//  NetworkResult.swift
//  SOPTSeminar6
//
//  Created by 곽기곤's Mac on 2020/11/21.
//

import Foundation

enum NetworkResult<T> {
    
    case success(T)
    case requestErr(T)
    case pathErr
    case serverErr
    case networkFail
}
