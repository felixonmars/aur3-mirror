#SYSUMOUNT - PKGBUILD
#Maintainer: Marek Strelec <marek.strelec@gmail.com>

pkgname=sysumount
pkgver=0.1
pkgrel=1
pkgdesc="A small application for unmounting devices"
arch=('any')
url="http://sourceforge.net/projects/sysumount/"
license=('GPL')
depends=('python2')
source=(http://sourceforge.net/projects/sysumount/files/Sysumount-${pkgver}/Sysumount-${pkgver}.tar.gz)
sha256sums=('e836dc6c3abbbb684d86b18b88a5684daa1c7df5cc2a4c5df32bbc4606b3502b')

package() {
  true
}

package() {
  mkdir -p "$pkgdir/usr/sbin"
  mv "$srcdir/Sysumount-${pkgver}/sysumount.py" "$pkgdir/usr/sbin/sysumount"
  chmod a+rx -R $pkgdir/usr/sbin/sysumount
  
}


# vim:set ts=2 sw=2 et:

