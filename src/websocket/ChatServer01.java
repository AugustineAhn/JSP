package websocket;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.server.ServerEndpoint;

	@ServerEndpoint("/ChatServer01")
	public class ChatServer01 {
		
		@OnOpen
		public void onOpen() {
	
			System.out.println("연결되었습니다....");
		}
		
		@OnClose
		public void onClose() {
	
			System.out.println("종료되었습니다...");
		}
		
		//클라이언트로부터 메시지가 도착
		@OnMessage
		public String onMessage(String message) {
				System.out.println("Client메세지:" + message);
				String echoMsg = "Server메세지:" + message;
				
				return echoMsg;
			}
		
		
		@OnError
		public void onError(Throwable e) {
			e.printStackTrace();
		}

}
