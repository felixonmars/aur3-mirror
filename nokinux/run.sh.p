--- src/run.sh	2010-04-15 16:58:48.701249946 +0200
+++ src/run.sh	2010-04-15 16:59:17.394554573 +0200
@@ -20,7 +20,7 @@
 # Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
 #
 
-install_path=`whereis -b nokinux | sed 's/nokinux: \(.*\)\/bin\/nokinux/\1/'`
+install_path="/usr"
 
 # Internazionalization
 TEXTDOMAIN="nokinux"
