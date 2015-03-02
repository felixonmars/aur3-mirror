# $Id$
# Maintainer: Andrew M Taylor <a.m.taylor303 at gmail dot com>

pkgname=shuriken
pkgver=0.4
pkgrel=1
pkgdesc="An open source beat slicer"
url="https://rock-hopper.github.io/shuriken"
arch=('x86_64' 'i686')
license=('GPL')
depends=('qt4' 'aubio' 'rubberband' 'libsamplerate' 'libsndfile' 'libx11')
makedepends=('automake' 'libtool' 'pkg-config' 'jack')
optdepends=('jack: A low-latency audio server')
install="$pkgname.install"
source=("https://github.com/rock-hopper/$pkgname/archive/v$pkgver.tar.gz"
        "$pkgname.desktop"
        "$pkgname.png")
sha256sums=('645d0264f0995c8b2c392f6061b346c47bbde6eafad21351e423cb6c7d0d5199'
            'f2144b34c35ecb855009a5d888d13bac2cf5b379274d7b60e4d9181d742fda99'
            'b637b82c35bb4f27eebe779c7790a85758e1b9c64fff8553ede207dda0d9cb37')

build() {
  cd "$pkgname-$pkgver"

  # make sndlib

  mkdir -p lib
  cd src/SndLibShuriken
  ./configure --without-audio --without-s7
  make
  mv -v libsndlib_shuriken.a ../../lib/
  cd ../..

  # make shuriken

  declare _arch=""

  if [[ $( lscpu | grep 'Architecture' ) =~ (x86_64) ]]; then
    _arch="-64"
  fi

  qmake-qt4 PREFIX=/usr ./Shuriken.pro -r -spec linux-g++$_arch
  make
}

package() {
  cd "$pkgname-$pkgver"

  make INSTALL_ROOT="$pkgdir" install

  install -Dm644 ../$pkgname.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"

  install -Dm644 ../$pkgname.png "$pkgdir/usr/share/icons/$pkgname.png"
}
