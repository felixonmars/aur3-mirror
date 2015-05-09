# Maintainer: Vertoe <vertoe AT darkcoin DOT io>
# Contributor: Mitsu <archlinux AT suumitsu DOT eu>
# Based on PKGBUILD from darkcoin-git maintained by Viliam Kubis <viliam dot kubis at gmail dot com>

pkgname='dashcore'
_gitname='dash'
pkgver=0.11.2.23
pkgrel=1
arch=('i686' 'x86_64')
url="http://www.dashpay.io/"
depends=('qt4' 'boost' 'boost-libs' 'miniupnpc' 'openssl' 'qrencode')
makedepends=('autoconf' 'automake' 'binutils' 'gcc' 'libtool' 'make' 'pkg-config' 'automoc4' 'protobuf')
license=('MIT')
pkgdesc="Dash Core (DASH, Dashpay, formerly Darkcoin) is an open source, privacy-centric digital currency. (Includes the qt-client, the headless daemon and the command-line tool.)"
provides=('dashd' 'dash-qt' 'dash-cli')
conflicts=('dashcore-git')

source=("https://github.com/dashpay/dash/archive/v$pkgver.tar.gz")
sha256sums=('2584de8958076b78f605bfdcf4a1a5ed5b709ffe5839e02677c874cf67a751d1')

build() {
  CXXFLAGS+=" -DBOOST_VARIANT_USE_RELAXED_GET_BY_DEFAULT=1"
	cd "$srcdir/$_gitname-$pkgver/"
	./autogen.sh
  ./configure --with-incompatible-bdb --enable-tests=no
  make
}

package() {
  install -D -m755 "$srcdir/$_gitname-$pkgver/src/qt/dash-qt" "$pkgdir/usr/bin/dash-qt"
  install -D -m755 "$srcdir/$_gitname-$pkgver/src/dashd" "$pkgdir/usr/bin/dashd"
  install -D -m755 "$srcdir/$_gitname-$pkgver/src/dash-cli" "$pkgdir/usr/bin/dash-cli"
  install -D -m644 "$srcdir/$_gitname-$pkgver/COPYING" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -D -m644 "$srcdir/$_gitname-$pkgver/share/pixmaps/dash128.png" "$pkgdir/usr/share/pixmaps/dash128.png"
  install -D -m644 "$srcdir/$_gitname-$pkgver/contrib/debian/dash-qt.desktop" "$pkgdir/usr/share/applications/dash-qt.desktop"
}



