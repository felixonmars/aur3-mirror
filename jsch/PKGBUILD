pkgname=jsch
pkgver=0.1.44
pkgrel=0
pkgdesc="JSch is a pure Java implementation of SSH2"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/jsch"
license=('BSD')
depends=('java-runtime')
source=(http://sourceforge.net/projects/${pkgname}/files/${pkgname}.jar/${pkgver}/${pkgname}-${pkgver}.jar)
md5sums=('182a2b7a3ebec420abddf65b52bfd4f0')

build() {
    install -D -m644 ${startdir}/src/${pkgname}-${pkgver}.jar ${startdir}/pkg/usr/share/java/${pkgname}/${pkgname}-${pkgver}.jar
    ln -s ${pkgname}-${pkgver}.jar ${startdir}/pkg/usr/share/java/${pkgname}/${pkgname}.jar
}
