# Contributor: fnord0 <AT> riseup <DOT> net
# Contributor: nblock <nblock [/at\] archlinux DOT us>
# Contributor: Robson Peixoto <robsonpeixoto@gmail.com>

pkgname=webscarab-ng
pkgver=0.2.1
pkgrel=1
pkgdesc="WebScarab NG (Next Generation) - a framework for analysing web applications that communicate using HTTP and HTTPS protocols"
arch=('any')
url="http://www.owasp.org/index.php/OWASP_WebScarab_NG_Project"
license=('GPL2')
depends=('java-runtime' 'hsqldb-java')
source=("http://webscarab-ng.googlecode.com/files/WebScarab-ng-${pkgver}.one-jar.zip")
md5sums=('deb33e77dcd4bc0fd51503523afadff7')

build() {
  mkdir -p "${pkgdir}/usr/share/${pkgname}"
  mkdir -p "${pkgdir}/usr/bin"
  install -m755 ${srcdir}/WebScarab-ng-${pkgver}.one-jar.jar "${pkgdir}/usr/share/${pkgname}/${pkgname}.jar"

  #create startup
  echo "#!/bin/sh" > ${pkgdir}/usr/bin/${pkgname}
  echo "exec \$JAVA_HOME/bin/java -cp /usr/share/java/hsqldb.jar org.hsqldb.util.DatabaseManager &" >> ${pkgdir}/usr/bin/${pkgname}
  echo "exec \$JAVA_HOME/bin/java -jar /usr/share/webscarab-ng/webscarab-ng.jar \$*" >> ${pkgdir}/usr/bin/${pkgname}
  chmod +x ${pkgdir}/usr/bin/${pkgname}

  #create /usr/share/webscarab-ng/howto.txt
  echo "1) run '/usr/bin/webscarab-ng' to start WebScarab-NG (and the HSQLDB Manager GUI)" > ${pkgdir}/usr/share/${pkgname}/howto.txt
  echo "2) copy the 'URL' exactly as listed in WebScarab-NG, and paste it into the 'URL' field within HSQLDB Manager GUI" >> ${pkgdir}/usr/share/${pkgname}/howto.txt
  echo "3) choose 'HSQL DataBase Engine Standalone' in the 'TYPE' drop-down box within the HSQLDB Manager GUI" >> ${pkgdir}/usr/share/${pkgname}/howto.txt
  echo "4) then hit 'OK' within HSQLDB Manager GUI, and hit 'OK' within WebScarab-NG" >> ${pkgdir}/usr/share/${pkgname}/howto.txt

  #notify user
  echo -e ""
	echo -e "\e[1;31m[\e[0m\e[1;34m*\e[0m\e[1;31m]\e[0m \e[1;31mrun '\e[0m\e[1;34m/usr/bin/webscarab-ng\e[0m\e[1;31m' to start WebScarab-NG (and the HSQLDB Manager GUI)\e[0m"
	echo -e "\e[1;31m[\e[0m\e[1;34m*\e[0m\e[1;31m]\e[0m \e[1;31mcopy the '\e[0m\e[1;34mURL\e[0m\e[1;31m' exactly as listed in WebScarab-NG, and paste it into the '\e[0m\e[1;34mURL\e[0m\e[1;31m' field within HSQLDB Manager GUI\e[0m"
	echo -e "\e[1;31m[\e[0m\e[1;34m*\e[0m\e[1;31m]\e[0m \e[1;31mchoose '\e[0m\e[1;34mHSQL DataBase Engine Standalone\e[0m\e[1;31m' in the '\e[0m\e[1;34mTYPE\e[0m\e[1;31m' drop-down box within the HSQLDB Manager GUI\e[0m"
	echo -e "\e[1;31m[\e[0m\e[1;34m*\e[0m\e[1;31m]\e[0m \e[1;31mthen hit '\e[0m\e[1;34mOK\e[0m\e[1;31m' within HSQLDB Manager GUI, and hit '\e[0m\e[1;34mOK\e[0m\e[1;31m' within WebScarab-NG\e[0m"
	echo -e "\e[1;34m>>>\e[0m \e[1;31mWebScarab-NG homepage @ \e[0m\e[1;32mhttp://www.owasp.org/index.php/OWASP_WebScarab_NG_Project\e[0m"
	echo -e ""
}

# vim:set ts=2 sw=2 noet:
