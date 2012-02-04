--- Record.cs	2006-05-11 21:14:56.000000000 +0200
+++ Record.cs.new	2006-05-11 21:05:10.000000000 +0200
@@ -290,7 +290,7 @@
 	
 	public void UdpReceiver()
 	{
-		Socket udpSocket;
+		Socket udpSocket = null;
 		while (true) {
 			bool firstTry = false;
 			try {
