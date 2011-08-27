# Maintainer: walterjwhite
# Contributor: Walter White <WalterWhite@walterjwhite.com>

pkgname=oracle-bea-weblogic
pkgver=9.2.4
pkgrel=2
pkgdesc="BEA Web Logic Server"
arch=('any')
url="http://www.oracle.com/technetwork/middleware/weblogic/downloads/wls-main-097127.html"
license=('custom:OTN')
depends=('java-environment')
source=(http://download/file/from/oracle/page/server924_linux32.zip)
md5sums=('8572951aabd33916aebebb1ae99305f6')
sha256sums=('31a515e011165312dd2181a59cd89ede49ca6eb9a7e658f09ba100223c7eeac3')

package() {
  echo "<?xml version=\"1.0\" encoding=\"UTF-8\"?>" > silent.xml
  echo "<domain-template-descriptor>" >> silent.xml
  echo -e "\t<input-fields>" >> silent.xml
  echo -e "\t<data-value name=\"BEAHOME\" value=\"/tmp/weblogic\" />" >> silent.xml
  echo -e "\t<data-value name=\"USER_INSTALL_DIR\" value=\"/tmp/weblogic/9.2.4\" />" >> silent.xml
  echo -e "\t<data-value name=\"INSTALL_NODE_MANAGER_SERVICE\" value=\"no\" />" >> silent.xml
  echo -e "\t<data-value name=\"COMPONENT_PATHS\" value=\"WebLogic Server|WebLogic Workshop|WebLogic Integration|WebLogic Portal\" />" >> silent.xml
  echo -e "\t</input-fields> " >> silent.xml
  echo -e "</domain-template-descriptor>" >> silent.xml
  
  chmod +x server924_linux32.bin
  ./server924_linux32.bin -mode=silent -silent_xml=silent.xml
  
  rm -rf ~/bea
  
  find . -type f -exec install -Dm644 "{}" "$pkgdir/opt/bea/{}" \;
}
