# Maintainer: vertoe <vertoe AT qhor DOT net>
# Contributor: deusstultus <deusstultus at gmail dot com>
# Contributor: Viliam Kubis <viliam dot kubis at gmail dot com>
# Based on PKGBUILD from vertcoin-git maintained by Lothar_m <lothar_m at riseup dot net>

pkgname='darkcoil'
pkgver=0.9.17.26
pkgrel=1
arch=('i686' 'x86_64')
url="https://www.darkco.in/"
depends=('qt4>=4.6' 'boost-libs>=1.46' 'miniupnpc>=1.6' 'qrencode>=3.4.3')
makedepends=('boost' 'automoc4' 'qrencode' 'miniupnpc' 'git')
license=('MIT')
pkgdesc="Lightweight Darkcoin wallet (Darkcoil project). Simply recieve, store and send coins. No additional features. (Includes both the qt-client and the headless daemon.)"
provides=('darkcoil')
conflicts=('darkcoin' 'darkcoin-git')
source=("https://github.com/vertoe/darkcoil/archive/v$pkgver.tar.gz")
sha512sums=('ec2ca33e4995d65b118e940ac2d1cd1f661e0764d83f090f88ef01353a5520e1ebdd6fe4cf88d4bb77bd22d176d891a864f8017546da546a1c2e2085fa03ff8a')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  # qt wallet
  qmake-qt4 USE_QRCODE=1 USE_UPNP=1
  make -j $(nproc)

  # headless daemon
  cd "$srcdir/$pkgname-$pkgver/src"
  make $MAKEFLAGS -j $(nproc) -f makefile.unix
}

package() {
  install -D -m755 "$srcdir/$pkgname-$pkgver/darkcoil-qt" "$pkgdir/usr/bin/darkcoil-qt"
  install -D -m755 "$srcdir/$pkgname-$pkgver/src/darkcoild" "$pkgdir/usr/bin/darkcoild"
  install -D -m644 "$srcdir/$pkgname-$pkgver/COPYING" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -D -m644 "$srcdir/$pkgname-$pkgver/share/pixmaps/bitcoin128.png" "$pkgdir/usr/share/pixmaps/darkcoil128.png"
  install -D -m644 "$srcdir/$pkgname-$pkgver/contrib/debian/darkcoin-qt.desktop" "$pkgdir/usr/share/applications/darkcoil.desktop"
}
