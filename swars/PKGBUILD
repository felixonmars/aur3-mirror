# Maintainer: Daniel Jeznach <djeznach@gmail.com>
pkgname=swars
pkgver=0.3
pkgrel=2
pkgdesc="Syndicate Wars port"
arch=('i686' 'x86_64')
url="http://swars.vexillium.org"
license=('GPL3')
depends=('python2' 'sdl' 'openal' 'libpng' 'zlib' 'libogg' 'libvorbis' 'vorbis-tools' 'cdparanoia')
makedepends=('gcc')
source=(http://swars.vexillium.org/files/$pkgname-$pkgver.tar.bz2)
md5sums=('05fa34a8a05a39827a50d41f505d6e49')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  if [[ $CARCH == "x86_64" ]]; then
    CFLAGS="-m32"
    LDFLAGS="-L/usr/lib32"
  fi

  CFLAGS=$CFLAGS LDFLAGS=$LDFLAGS ./configure --prefix=/usr

  # Force to use python2 instead of 3
  sed -i -e 's/python/python2/' conf/Makefile
  sed -i -e 's/python/python2/' src/Makefile
  sed -i -e 's/python/python2/' Makefile
  sed -i -e 's/python/python2/' util/asfilter
  sed -i -e 's/python/python2/' util/chgcalls
  sed -i -e 's/python/python2/' util/mkwrappers
  sed -i -e 's/python/python2/' util/Makefile

  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
  mkdir -p "$pkgdir/usr/share/swars"
  install -m755 "$srcdir/$pkgname-$pkgver/util/install" "$pkgdir/usr/bin/swars_install"
}
