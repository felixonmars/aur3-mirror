# Maintainer: Dan Serban
# Contributor: Ali H. Caliskan <ali.h.caliskan AT gmail DOT com>

pkgname=adempiere
pkgver=3.70
pkgrel=1
pkgdesc="An Open Source Business Suite ERP/CRM/MFG/SCM/POS."
arch=(i686 x86_64)
url=("http://www.adempiere.com/")
license=('GPL')
depends=('java-runtime' 'java-environment' 'postgresql')
source=('http://downloads.sourceforge.net/adempiere/Adempiere_370LTS.tar.gz' 'SilentSetup.properties')
md5sums=('e6c08a055f1240fbe1e938cfa7f8faa0' '650fc2e662bff7fe00963a4fd40f75d1')

package()
{
cd $srcdir
# cp AdempiereEnv.properties Adempiere/
msg "Install Adempiere Server"
if [ $JAVA_HOME ]; then
  JAVA=$JAVA_HOME/bin/java
  KEYTOOL=$JAVA_HOME/bin/keytool
else
#   JAVA=java
  KEYTOOL=keytool
  echo "JAVA_HOME is not set."
  echo "You may not be able to start the Setup"
  echo "Set JAVA_HOME to the directory of your local JDK."
fi
install -d $pkgdir/srv/http/adempiere/Adempiere/keystore
cd Adempiere
echo "==================================="
echo "Starting Setup ..."
echo "==================================="
# Patch default configuration
cat > $srcdir/Adempiere/AdempiereEnv.properties<<EndScript
ADEMPIERE_HOME=$pkgdir/srv/http/adempiere/Adempiere
ADEMPIERE_KEYSTORE=$pkgdir/srv/http/adempiere/Adempiere/keystore/myKeystore
EndScript
cat $srcdir/SilentSetup.properties >> $srcdir/Adempiere/AdempiereEnv.properties
cp $srcdir/SilentSetup.properties $srcdir/Adempiere/Adempiere.properties

# Trace Level Parameter, e.g. ARGS=ALL
ARGS=CONFIG
CP=lib/CInstall.jar:lib/Adempiere.jar:lib/CCTools.jar:lib/oracle.jar:lib/derby.jar:lib/fyracle.jar:lib/jboss.jar:lib/postgresql.jar:
$JAVA -classpath $CP -DADEMPIERE_HOME=$ADEMPIERE_HOME org.compiere.install.SilentSetup $ARGS
echo "==================================="
echo "Make .sh executable & set Env"
echo "==================================="
chmod -R a+x *.sh
find . -name '*.sh' -exec chmod a+x '{}' \;
# Sign database build
cd utils
. RUN_SignDatabaseBuild.sh > /dev/null 2>&1
. RUN_UnixEnv.sh
echo "."
echo "For problems, check log file in base directory"
msg "Installation complete"
}
