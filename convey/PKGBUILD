# Contributor: Nathan Owe <ndowens.aur at gmail dot com>
pkgname=convey
pkgver=0.3
pkgrel=2
pkgdesc="A java jabber IM client"
arch=('i686' 'x86_64')
url="http://convey.sourceforge.net"
license=('unknown')
depends=('java-runtime')
source=(http://convey.sourceforge.net/downloads/${pkgname}-${pkgver}.tar.gz 'convey.sh')
md5sums=('7ef638901ae87d99fc5f37908f90a536' \
'18e218d08e34bbabcce5b141ba1ce371') 

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  install -d ${pkgdir}/usr/{share/${pkgname},bin}
  install lib/*.jar ${pkgdir}/usr/share/${pkgname}/
  install -m755 ${srcdir}/convey.sh ${pkgdir}/usr/bin/convey
}
