pkgname=jta
pkgver=2.6
_pkgver=26
pkgrel=3
pkgdesc="JTA is a Java implementation of Telnet"
arch=('i686' 'x86_64')
url="http://javassh.org"
license=('GPL')
depends=('java-runtime' 'jsch')
source=(http://javassh.org/download/${pkgname}${_pkgver}.jar)
md5sums=('77f277b9c39fa9eb74a36a82c52e228c')

build() {
    install -D -m644 ${startdir}/src/${pkgname}${_pkgver}.jar ${startdir}/pkg/usr/share/java/${pkgname}/${pkgname}-${pkgver}.jar
    ln -s ${pkgname}-${pkgver}.jar ${startdir}/pkg/usr/share/java/${pkgname}/${pkgname}.jar
}
