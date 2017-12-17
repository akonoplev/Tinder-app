//
//  RealTimeManager.swift
//  Tinder
//
//  Created by Андрей Коноплев on 17.12.17.
//  Copyright © 2017 Андрей Коноплев. All rights reserved.
//

import Foundation
import SocketRocket

class RealTimeManager: NSObject
{
    static let sharedInstance = RealTimeManager()
    private var socketInstance: SRWebSocket?
    private let connectURL = "wss://keepalive.gotinder.com/ws?token=3cdd9330-6c49-41a0-ba9e-0ea27e6c8356"
    
    func fireUp()
    {
        socketInstance = SRWebSocket(url: URL(string: connectURL)!)
        socketInstance?.delegate = self
        socketInstance?.open()
    }
}

//MARK: - func web socket delegate
extension RealTimeManager: SRWebSocketDelegate
{
    func webSocketDidOpen(_ webSocket: SRWebSocket!) {
        print("Cоединение WebSocket установлено")
    }
    
    func webSocket(_ webSocket: SRWebSocket!, didFailWithError error: Error!) {
        print("Соединение с WebSocket не удалось установить \(error.localizedDescription)")
    }
    
    func webSocket(_ webSocket: SRWebSocket!, didReceiveMessage message: Any!) {
        print("пришло сообщение \(message)")
    }
    
}

