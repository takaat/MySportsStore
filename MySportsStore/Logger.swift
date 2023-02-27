//
//  Logger.swift
//  MySportsStore
//
//  Created by mana on 2023/01/18.
//

import Foundation

class Logger<T> {
    var dataItems: [T] = [];
    var callback: (T) -> Void;

    init(callback:@escaping (T) -> Void) {
        self.callback = callback;
    }

    func logItem(item:T) {
        dataItems.append(item);
        callback(item);
    }

    func processItems(callback: (T) -> Void) {
        for item in dataItems {
            callback(item);
        }
    }
}
