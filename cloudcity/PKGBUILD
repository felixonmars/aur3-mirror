# Maintainer: Whitney Marshall <whitney.marshall@gmail.com>
pkgname=cloudcity
pkgver=svn
pkgrel=1
pkgdesc="A native style for Qt/KDE4"
arch=('i686' 'x86_64')
url="http://cloudcity.sourceforge.net"
license=('LGPL')
depends=('kdebase-runtime>=4' 'kdebase-workspace>=4')
makedepends=('cmake' 'automoc4')
source=($pkgname.tar.gz::http://cloudcity.svn.sourceforge.net/viewvc/$pkgname.tar.gz?view=tar)
md5sums=('641c37b529e4de2806a365d9e6ec6c47')

build() {
  cd "$srcdir/$pkgname"
  mkdir build > /dev/null 2>&1
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=$(kde4-config --prefix) -DCMAKE_BUILD_TYPE=Release ..
  make
}

package() {
  cd "$srcdir/$pkgname/build"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
