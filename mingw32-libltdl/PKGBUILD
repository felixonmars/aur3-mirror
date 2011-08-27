# Maintainer: Matěj Týč <bubla@users.sf.net>

# NOTE: requires rebuilt with each new gcc version

pkgname=mingw32-libltdl
pkgver=2.4
pkgrel=1
pkgdesc="mingw32 port of libtool's libltdl library"
arch=('any')
url="http://www.gnu.org/software/libtool"
license=('GPL')
depends=('mingw32-gcc')
options=('!libtool')
#install=libtool.install
source=(http://ftp.gnu.org/gnu/libtool/libtool-2.4.tar.xz)
md5sums=('4e6144439d95d7332dc50ace6dd24c55')

build() {
  cd ${srcdir}/libtool-${pkgver}/libltdl
  unset LDFLAGS
  ./configure --host=i486-mingw32 --prefix=/usr/i486-mingw32 --enable-ltdl-install
  make
}

package() {
  cd ${srcdir}/libtool-${pkgver}/libltdl
  make DESTDIR=${pkgdir} install
}
