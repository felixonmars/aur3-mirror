# Maintainer: Joe Stringer <joestringernz@gmail.com>
pkgname=libnbee
pkgver=0.3.90
pkgrel=6
pkgdesc="A new library for packet processing"
url="http://www.nbee.org"
arch=('x86_64' 'i686')
license=('LGPL')
depends=('xerces-c-2' 'pcre' 'libpcap')
optdepends=('sqlite3')
makedepends=('cmake chrpath')
source=(http://www.nbee.org/download/nbeesrc-12-06-01.zip)
md5sums=('3c2b6de2c9d0451c801666ebf58cfe2a');

build() {
  cd "${srcdir}/netbee/src"

  # Fix issues with building against bison-2.6
  sed -i '78s|void \*\*|void \*|' "nbprotodb/expressions.cpp"

  cmake ./ -DCMAKE_INSTALL_PREFIX=/usr
  make

  cd "${srcdir}/netbee/tools"
  cmake ./ -DCMAKE_INSTALL_PREFIX=/usr
  make

  cd "${srcdir}/netbee"
  ./createdoc.sh
}

package() {
  cd "${srcdir}/netbee"

  # There's no make install for this project :(
  chrpath -d bin/*.so

  install -dm755 $pkgdir/usr/lib
  install -Dpm755 bin/*.so $pkgdir/usr/lib/

  install -dm755 $pkgdir/usr/bin
  install -Dpm755 bin/nbeedump bin/nbextractor $pkgdir/usr/bin

  install -dm755 $pkgdir/usr/share/$pkgname/
  install -Dpm755 bin/*.xml bin/*.txt bin/*.acp $pkgdir/usr/share/$pkgname/

  install -dm755 $pkgdir/usr/include
  install -Dpm755 include/*.h $pkgdir/usr/include/

  install -dm755 $pkgdir/usr/share/doc/$pkgname/
  install -Dpm755 readme-compile.txt readme-compile.htm readme-devpack.txt readme-release.txt $pkgdir/usr/share/doc/$pkgname/
  install -dm755 release/website/exports $pkgdir/usr/share/doc/$pkgname/
}

# vim:set ts=2 sw=2 et:
