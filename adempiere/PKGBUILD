# Maintainer: Dan Serban
# Contributor: Ali H. Caliskan <ali.h.caliskan AT gmail DOT com>

pkgname=adempiere
pkgver=3.60
pkgrel=1
pkgdesc="An Open Source Business Suite ERP/CRM/MFG/SCM/POS."
arch=(i686 x86_64)
url=("http://www.adempiere.com/")
license=('GPL')
depends=('java-runtime' 'java-environment' 'postgresql')
source=('http://downloads.sourceforge.net/adempiere/Adempiere_360LTS.tar.gz' 'SilentSetup.properties')
md5sums=('718472fd4c93ca77a3fd831dec498b38' '312017dd6970428779fb1f75b6045635')

build()
{
cd $srcdir
cp AdempiereEnv.properties Adempiere/
msg "Install Adempiere Server"
if [ $JAVA_HOME ]; then
  JAVA=$JAVA_HOME/bin/java
  KEYTOOL=$JAVA_HOME/bin/keytool
else
  JAVA=java
  KEYTOOL=keytool
  echo "JAVA_HOME is not set."
  echo "You may not be able to start the Setup"
  echo "Set JAVA_HOME to the directory of your local JDK."
fi
install -d $pkgdir/home/adempiere/Adempiere/keystore
cd Adempiere
echo "==================================="
echo "Starting Setup ..."
echo "==================================="
# Patch default configuration
cat > $srcdir/Adempiere/AdempiereEnv.properties<<EndScript
ADEMPIERE_HOME=$pkgdir/home/adempiere/Adempiere
ADEMPIERE_KEYSTORE=$pkgdir/home/adempiere/Adempiere/keystore/myKeystore
EndScript
cat $srcdir/SilentSetup.properties >> $srcdir/Adempiere/AdempiereEnv.properties
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
