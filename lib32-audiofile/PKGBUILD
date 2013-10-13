# Maintainer: peace4all <markspost at rocketmail dot com>

_pkgbase=audiofile
pkgname=lib32-$_pkgbase
pkgver=0.3.6
pkgrel=2
pkgdesc="Silicon Graphics Audio File Library (32-bit)"
arch=('x86_64')
url="http://www.68k.org/~michael/audiofile/"
license=('LGPL')
depends=('lib32-gcc-libs' 'audiofile' 'lib32-alsa-lib' 'lib32-flac')
makedepends=('gcc-multilib')
options=('!libtool')
source=("http://audiofile.68k.org/$_pkgbase-$pkgver.tar.gz")
md5sums=('2731d79bec0acef3d30d2fc86b0b72fd')

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  cd "$srcdir/$_pkgbase-$pkgver"
  ./configure --prefix=/usr --libdir=/usr/lib32
  make
}

package() {
  cd "$srcdir/$_pkgbase-$pkgver"
  make DESTDIR="$pkgdir" install
  rm -rf "$pkgdir"/usr/{include,share,bin}
}
