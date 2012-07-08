--- codecs/gif.cc.orig	2010-03-03 16:04:44.000000000 -0500
+++ codecs/gif.cc	2012-06-08 14:47:50.000000000 -0400
@@ -232,7 +243,7 @@
   }
   free (OutputBuffer);
 
-  delete (RedBuffer); delete (GreenBuffer); delete (BlueBuffer);
+  delete[] RedBuffer; delete[] GreenBuffer; delete[] BlueBuffer;
 
   EGifCloseFile(GifFile);
   return true;
