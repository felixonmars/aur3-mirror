# Maintainer: andreas_baumann <abaumann@yahoo.com>

pkgname=gstlfilt
pkgver=20080302
pkgrel=1
pkgdesc="An STL Error Message Decryptor for C++"
arch=('i686' 'x86_64')
url="http://www.bdsoft.com/tools/stlfilt.html"
license="custom"
depends=('perl')
source=('http://www.bdsoft.com/dist/gstlfilt.tar')
md5sums=('bb0081d0bb2e5a24afaf16ed3cf897b9')

build() {
  install -d $pkgdir/usr/bin
  install -m 0755 gfilt $pkgdir/usr/bin
  install -m 0755 gSTLFilt.pl $pkgdir/usr/bin
}
