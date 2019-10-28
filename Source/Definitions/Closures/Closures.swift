//
//  Closures.swift
//  Trivia
//
//  Created by Can Özcan on 24.10.2019.
//  Copyright © 2019 CanOzcan. All rights reserved.
//

import Foundation

public typealias Action = (() -> Void)
public typealias ActionWith<ParamType> = ((ParamType) -> Void)
public typealias Function<ReturnType> = (() -> ReturnType)
public typealias FunctionWith<ParamType, ReturnType> = ((ParamType) -> ReturnType)
