#Maintainer: Stéphane Marguet (Stemp) <smarguet à gmail point com>

pkgname=svv
pkgver=0.3
pkgrel=2
pkgdesc="Simple V4L2 video viewer"
url="http://moinejf.free.fr/"
changelog=ChangeLog
license=('GPL')
depends=('v4l-utils' 'gtk2')
arch=(i686 x86_64)
source=("http://moinejf.free.fr/svv.c")
md5sums=('29fda341b5db1b9819f4dc6f75bf9a4b')

build() {
  cd $srcdir
  gcc -Wall -O2 svv.c -o svv $(pkg-config gtk+-2.0 libv4lconvert --cflags --libs)
}

package() {
  mkdir -p ${pkgdir}/usr/local/bin/
  cp -r ${srcdir}/svv ${pkgdir}/usr/local/bin/
}