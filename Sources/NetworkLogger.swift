import Foundation

struct NetworkLogger {
    static func logRequest(_ request: URLRequest, isDebug: Bool) {
        guard isDebug else { return }
        print("[NetworkLogger]-----------------------------------✅ ➡️ REQUEST ➡️ ✅------------------------------------")
        print("[NetworkLogger] METHOD:", "\(request.httpMethod)," ?? ",", "URL:", request.url?.absoluteString ?? "")
        
        if let headers = request.allHTTPHeaderFields {
            print("[NetworkLogger] HEADERS:", headers)
        }
        
        if let body = request.httpBody {
            print("[NetworkLogger] BODY:", body.jsonString())
        }
        print("[NetworkLogger]-----------------------------------✅ ➡️ END REQUEST ➡️ ✅------------------------------------")
    }
    
    static func logResponse(data: Data?, response: URLResponse?, isDebug: Bool) {
        guard isDebug else { return }
        print("[NetworkLogger]-----------------------------------✅ ⬅️ RESPONSE ⬅️ ✅------------------------------------")
        
        if let http = response as? HTTPURLResponse {
            print("[NetworkLogger] STATUS:", http.statusCode)
            print("[NetworkLogger] HEADERS:", http.allHeaderFields)
        }
        
        if let data {
            print("[NetworkLogger] BODY:", data.jsonString())
        }
        print("[NetworkLogger]-----------------------------------✅ ⬅️ END RESPONSE ⬅️ ✅------------------------------------")
    }
}
