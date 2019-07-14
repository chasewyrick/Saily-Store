//
//  DMPackages.swift
//  Tweaker
//
//  Created by Lakr Aream on 2019/7/14.
//  Copyright © 2019 Lakr Aream. All rights reserved.
//

// MARK: DATABASE
class DBMPackage: WCDBSwift.TableCodable {
    
    var id = String()
    var latest_update_time = String()
    // 版本容器包含了 【版本号 ： 【软件源地址 ： 【属性 ： 属性值】】】
    var version = [String : [String : [String : String]]]()
    var signal = String()
    
    enum CodingKeys: String, CodingTableKey { // swiftlint:disable:next nesting
        typealias Root = DBMPackage
        
        case id
        case latest_update_time
        case version
        case signal
        
        static let objectRelationalMapping = TableBinding(CodingKeys.self)
        
        static var columnConstraintBindings: [CodingKeys: ColumnConstraintBinding]? {
            return [
                id: ColumnConstraintBinding(isPrimary: true, isUnique: true)
            ]
        }
    }
    
}
