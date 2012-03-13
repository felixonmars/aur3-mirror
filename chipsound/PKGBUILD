# Maintainer: SpepS <dreamspepser at yahoo dot it>

_name=ChipSound
pkgname=chipsound
pkgver=0.1.0
pkgrel=1
pkgdesc="An interactive, structured realtime audio engine"
arch=(i686 x86_64)
url="http://olofsonarcade.com/2012/03/13/chipsound-0-1-0-released-zlib-license/"
license=('custom:zlib')
depends=('sdl')
makedepends=('cmake')
source=(http://www.olofson.net/download/$_name-$pkgver.tar.bz2)
md5sums=('1b75f0b3e9a8b27e0d6aebccbc50686e')

build() {
  cd "$srcdir/$_name"

  # cstest data path fix
  sed -i "s|data/|/usr/share/$pkgname/&|" \
    test/{gui,cstest}.c

  [ -d bld ] || mkdir bld && cd bld
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr \
           -DCMAKE_BUILD_TYPE=Release
  # insecure rpath fix
  sed -i "s/rpath/&-link/" \
    test/CMakeFiles/cstest.dir/link.txt
  make
}

package() {
  cd "$srcdir/$_name/bld"
  make DESTDIR="$pkgdir/" install

  # cstest bin
  install -Dm755 test/cstest \
    "$pkgdir/usr/bin/cstest"

  # cstest data
  install -d "$pkgdir/usr/share/$pkgname/data"
  install -Dm644 ../test/data/* \
    "$pkgdir/usr/share/$pkgname/data"

  # docs
  install -Dm644 ../programming.txt \
    "$pkgdir/usr/share/doc/$pkgname/programming.txt"

  # kate syntax file
  install -Dm644 ../$pkgname.xml \
    "$pkgdir/usr/share/apps/katepart/syntax/$pkgname.xml"

  # license
  install -Dm644 ../COPYING \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
