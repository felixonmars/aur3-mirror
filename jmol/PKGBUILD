# Maintainer: James Spencer <james.s.spencer@gmail.com>

pkgname=jmol
_basever=14.2
_reldate=2014.11.23
pkgver=14.2.9
pkgrel=1
pkgdesc="a Java 3D viewer for chemical structures"
arch=('i686' 'x86_64')
url="http://jmol.sourceforge.net"
license=('LGPL')
depends=('java-environment')
source=(http://downloads.sourceforge.net/project/jmol/Jmol/Version%20${_basever}/Version%20${pkgver}/Jmol-${pkgver}_${_reldate}-binary.tar.gz)
sha1sums=('c7ff086a1dd9c9e47ca69bb194fe350f939c4414')

package() {

  mkdir -p $pkgdir/usr/lib/$pkgname
  mkdir -p $pkgdir/usr/bin
  install -D "$srcdir/$pkgname-${pkgver}_${_reldate}/"* "$pkgdir/usr/lib/$pkgname"
  ln -s "/usr/lib/$pkgname/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"

}
