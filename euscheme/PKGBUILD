# Creator: Peter Feigl <craven@gmx.net>
pkgname=euscheme
pkgver=1
pkgrel=1
pkgdesc="A EuLisp level-0 implementation"
url="http://people.bath.ac.uk/masrjb/Sources/euscheme.html"
arch=(i686 x86_64)
license=(unknown)
depends=(make)
source=(http://people.bath.ac.uk/masrjb/Sources/euscheme361.tgz)
build() {
  cd ${srcdir}/Euscheme
  mkdir -p ${pkgdir}/usr/bin
  mkdir -p ${pkgdir}/usr/share/euscheme/{Image,Modules}
  sed -i -e "s|^DESTBIN = .*|DESTBIN = ${pkgdir}/usr/bin|" -e "s|^DESTLIB = .*|DESTLIB = ${pkgdir}/usr/share/euscheme|" Makefile
  sed -i -e 's|^IMAGE_SEARCH_PATH = .*|IMAGE_SEARCH_PATH = "/usr/share/euscheme/Image"|' Makefile
  sed -i -e 's|^MODULE_SEARCH_PATH = .*|MODULE_SEARCH_PATH = "/usr/share/euscheme/Modules"|' Makefile
  make
  make install
  mkdir -p ${pkgdir}/usr/share/man/man1
  install euscheme.1 ${pkgdir}/usr/share/man/man1
}


md5sums=('4079d81a817c02d921000e34786c9a0b')
