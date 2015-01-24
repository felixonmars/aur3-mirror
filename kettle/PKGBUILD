pkgname=kettle
pkgver=5.2.0.0
_dl_dir=5.2
_dl_suffix=209
pkgrel=2
pkgdesc="Pentaho Data Integration Community Edition (Kettle) is an ETL tool"
arch=any
url="http://kettle.pentaho.com/"
depends=(java-environment
         swt
         webkitgtk)
makedepends=(zip)
license=("LGPLv2.1")
options=(!strip)
source=("http://downloads.sourceforge.net/project/pentaho/Data%20Integration/${_dl_dir}/pdi-ce-${pkgver}-${_dl_suffix}.zip"
        "spoon.desktop"
        "Market.class")
md5sums=('39fad43ff2254fe832926e00c4ed553f'
         'd25747bb2d5b45c3e87b08e4c3102723'
         'e9c6606ac0831f110d57acde5a5dc530')

package() {
  cd "$srcdir/data-integration"
  rm -rf "Data Integration.app"
  rm *.bat
  rm README_{OSX,UNIX_AS400,INFOBRIGHT}.txt
  rm -rf libswt/{aix,aix64,hpux,osx,osx64,solaris,solaris-x86,win32,win64}

  # replace swt
  #rm -rf libswt/linux/{ppc64,ppc}
  rm -rf libswt/linux
  mkdir -p libswt/linux/{x86,x86_64}
  ln -s /usr/share/java/swt.jar libswt/linux/x86
  ln -s /usr/share/java/swt.jar libswt/linux/x86_64
  patch -p0 <<'EOD'
--- spoon.sh	2015-01-23 00:55:41.877213470 +0100
+++ spoon.sh	2015-01-23 00:48:16.602516085 +0100
@@ -112,14 +112,14 @@
 			x86_64)
 				if $($_PENTAHO_JAVA -version 2>&1 | grep "64-Bit" > /dev/null )
                                 then
-				  LIBPATH=$BASEDIR/../libswt/linux/x86_64/
+				  LIBPATH=$BASEDIR/../libswt/linux/x86_64/:/usr/lib/
                                 else
-				  LIBPATH=$BASEDIR/../libswt/linux/x86/
+				  LIBPATH=$BASEDIR/../libswt/linux/x86/:/usr/lib/
                                 fi
 				;;
 
 			i[3-6]86)
-				LIBPATH=$BASEDIR/../libswt/linux/x86/
+				LIBPATH=$BASEDIR/../libswt/linux/x86/:/usr/lib/
 				;;
 
 			ppc)
@@ -196,6 +196,10 @@
 # optional line for attaching a debugger
 # OPT="$OPT -Xdebug -Xnoagent -Djava.compiler=NONE -Xrunjdwp:transport=dt_socket,server=y,suspend=n,address=5005"
 
+# Unfortunately, I'm getting a hang in _webkit_web_view_get_type()
+# This is a crude way of avoiding webkitgtk being used
+export SWT_GTK3=0
+
 # ***************
 # ** Run...    **
 # ***************
EOD

  # save 443 MB
  # rm -rf plugins/pentaho-big-data-plugin

  cd ..
  F='#!/usr/bin/bash\n\n/usr/share/data-integration/%s.sh "$@"\n'
  printf "$F" kitchen > kitchen.sh
  install -D -m755 kitchen.sh $pkgdir/usr/bin/kitchen.sh
  printf "$F" pan > pan.sh
  install -D -m755 pan.sh     $pkgdir/usr/bin/pan.sh
  printf "$F" carte > carte.sh
  install -D -m755 carte.sh   $pkgdir/usr/bin/carte.sh
  printf "$F" import > import.sh
  install -D -m755 import.sh  $pkgdir/usr/bin/import.sh
  #spoon needs to change directory
  echo -e '#!/usr/bin/bash\n\ncd /usr/share/data-integration\n./spoon.sh "$@"\n' > spoon.sh
  install -D -m755 spoon.sh   $pkgdir/usr/bin/spoon.sh
  install -D -m644 spoon.desktop $pkgdir/usr/share/applications/spoon.desktop

  # patched Market.class for installing plugins in ~/.kettle/plugins

  #diff --git a/plugins/market/src/org/pentaho/di/core/market/Market.java b/plugins/market/src/org/pentaho/di/core/market/Market.java
  #index b900c70..c5c21aa 100644
  #--- a/plugins/market/src/org/pentaho/di/core/market/Market.java
  #+++ b/plugins/market/src/org/pentaho/di/core/market/Market.java
  #@@ -192,9 +192,8 @@ public class Market implements SpoonPluginInterface {
  #     } else {
  #       String subfolder = getInstallationSubfolder( marketEntry );
  # 
  #-      // Use current directory (should be the Kettle distribution directory) as the root folder to install plugins
  #-      // This is because plugin types are not guaranteed to search the ~/.kettle folder for plugins.
  #-      return "plugins" + ( subfolder == null ? "" : Const.FILE_SEPARATOR + subfolder );
  #+      return Const.getKettleDirectory() + Const.FILE_SEPARATOR +
  #+          "plugins" + (subfolder == null ? "" : Const.FILE_SEPARATOR + subfolder);
  #     }
  #   }

  mkdir -p org/pentaho/di/core/market
  cp ../Market.class org/pentaho/di/core/market
  zip data-integration/plugins/market/market-${pkgver}-${_dl_suffix}.jar \
      org/pentaho/di/core/market/Market.class


  cp -a data-integration "$pkgdir/usr/share/data-integration"
  chown -R root:root $pkgdir/usr/share
}

# vim:set ts=2 sw=2 et:
