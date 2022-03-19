//
//  Standard.swift
//  V2EX You (iOS)
//
//  Created by Mak Ho-Cheung on 2021/12/11.
//

import SwiftUI

let HOTTEST_NODES = ["programmer", "create", "share", "apple", "jobs", "all4all", "guangzhou", "qna"]
let jsonEncoder = JSONEncoder()
let jsonDecoder = JSONDecoder()
let htmlTemplate = try! String(contentsOf: Bundle.main.url(forResource: "index", withExtension: "html", subdirectory: "Data")!)
let htmlDarkTemplate = try! String(contentsOf: Bundle.main.url(forResource: "index_dark", withExtension: "html", subdirectory: "Data")!)
let nodesJson = try! String(contentsOf: Bundle.main.url(forResource: "nodes", withExtension: "json", subdirectory: "Data")!)
let nodes = try! jsonDecoder.decode([Node].self, from: nodesJson.data(using: .utf8)!)

// debugData
#if DEBUG
    let debugTopicsJson = try! String(contentsOf: Bundle.main.url(forResource: "topics", withExtension: "json", subdirectory: "Data")!)
    let debugTopics = try! jsonDecoder.decode([Topic].self, from: debugTopicsJson.data(using: .utf8)!)

    let debugTopicJson = try! String(contentsOf: Bundle.main.url(forResource: "topic", withExtension: "json", subdirectory: "Data")!)
    let debugTopic = try! jsonDecoder.decode(Topic.self, from: debugTopicJson.data(using: .utf8)!)

    let debugRepliesJson = try! String(contentsOf: Bundle.main.url(forResource: "replies", withExtension: "json", subdirectory: "Data")!)
    let debugReplies = try! jsonDecoder.decode([Reply].self, from: debugRepliesJson.data(using: .utf8)!)

    let debugReplyJson = try! String(contentsOf: Bundle.main.url(forResource: "reply", withExtension: "json", subdirectory: "Data")!)
    let debugReply = try! jsonDecoder.decode(Reply.self, from: debugReplyJson.data(using: .utf8)!)
#endif

func timestamp2Date(timestamp: Int64) -> String {
    var timeStr: String = ""
    let duration = Int64(Date.now.timeIntervalSince1970) - timestamp
    switch duration {
    case 1 ... 10: timeStr = "几秒前"
    case 11 ... 20: timeStr = "十几秒前"
    case 21 ... 60: timeStr = "几十秒前"
    case 61 ... 600: timeStr = "几分钟前"
    case 601 ... 1200: timeStr = "十几分钟前"
    case 1201 ... 3600: timeStr = "几十分钟前"
    case 3601 ... 7200: timeStr = "一个小时前"
    case 7201 ... 14400: timeStr = "几个小时前"
    case 14400 ... 43200: timeStr = "十几小时前"
    case 43201 ... 86400: timeStr = "一天前"
    default:
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        timeStr = formatter.string(from: Date(timeIntervalSince1970: Double(timestamp)))
    }
    return timeStr
}

extension View {
    func hidden(_ shouldHide: Bool) -> some View {
        opacity(shouldHide ? 0 : 1)
    }
}
