//
//  UserDefaultsWrapper.swift
//  ATCocoaKit
//
//  Created by swifter on 2019/10/9.
//

import HandyJSON

extension Bool: HandyJSON {  }
extension String: HandyJSON {  }
extension Int: HandyJSON {  }

public enum UserDefaultsWrapperKey {
    case base(String)
    case handyJSON(String)
}


@propertyWrapper
/// UserDefaults Wrapper
///
/// 使用
/// =============
///     // HandyJSON Type
///     class Person: HandyJSON {
///         var name = ""
///         required init() {}
///     }
///     @UserDefaultsWrapper(key: .handyJSON("person"), defaultValue: Person())
///     var person
///
///     // Base Type
///     @UserDefaultsWrapper(key: .base("username"), defaultValue: "")
///     var username: String

public struct UserDefaultsWrapper<T: HandyJSON> {
    let key: UserDefaultsWrapperKey
    let defaultValue: T
    public init(key: UserDefaultsWrapperKey, defaultValue: T) {
        self.key = key
        self.defaultValue = defaultValue
    }
    
    public var wrappedValue: T {
        get {
            switch key {
            case .base(let keyString):
                return UserDefaults.standard.value(forKey: keyString) as? T ?? defaultValue
            case .handyJSON(let keyString):
                if let string = UserDefaults.standard.value(forKey: keyString) as? String, let object = T.deserialize(from: string) {
                    return object
                }
                return defaultValue
            }
        }
        set {
            switch key {
            case .base(let keyString):
                UserDefaults.standard.set(newValue, forKey: keyString)
            case .handyJSON(let keyString):
                UserDefaults.standard.set(newValue.toJSONString() ?? "", forKey: keyString)
            }
        }
    }
}
