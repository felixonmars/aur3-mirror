# Maintainer: Peter Wu <lekensteyn@gmail.com>
# Contributor: nblock <nblock [/at\] archlinux DOT us>
# Contributor: Robson Peixoto <robsonpeixoto@gmail.com>

pkgname=webscarab
pkgver=20130315.git097a271
pkgrel=1
pkgdesc="Framework for analysing applications that communicate using the HTTP and HTTPS protocols"
arch=('any')
url="http://www.owasp.org/index.php/Category:OWASP_WebScarab_Project"
license=('GPL2')
depends=('java-runtime')
noextract=("${pkgname}-${pkgver}.jar")
# Created with `mvn package`
source=(http://lekensteyn.nl/files/webscarab/${pkgname}-${pkgver}.jar)
md5sums=('4c22e7de5ea62e70a395526963610755')

package() {
  install -m755 -d "${pkgdir}/usr/bin"
  install -m644 -D "$srcdir/${pkgname}-${pkgver}.jar" \
  "${pkgdir}/usr/share/java/${pkgname}/${pkgname}.jar"

  echo "#!/bin/sh" > "${pkgdir}/usr/bin/${pkgname}"
  echo 'exec "$JAVA_HOME/bin/java" -jar /usr/share/java/webscarab/webscarab.jar "$@"' >> "${pkgdir}/usr/bin/${pkgname}"
  chmod 755 ${pkgdir}/usr/bin/${pkgname}
}

# vim:set ts=2 sw=2 noet:
