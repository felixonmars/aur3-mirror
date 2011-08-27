--- pesstream.h.orig	2006-05-02 20:20:31.000000000 +0200
+++ pesstream.h	2006-05-02 20:16:48.000000000 +0200
@@ -25,7 +25,7 @@
 	private:
 		static int		m_st_nr;
 		int			m_nr;
-		enum S_TYPE		m_stype;
+		S_TYPE		m_stype;
 		class CBuffer *		mp_cbuf;
 		class xlist *		mp_list;
 
