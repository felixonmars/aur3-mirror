# Maintainer: deusstultus <deusstultus@gmail.com>
##From pkgbase=bitcoin
# Contributor: Timothy Redaelli <timothy.redaelli@gmail.com>
# Contributor: shahid <helllamer@gmail.com>
##From pkgname=darkcoin-git
# Contributor: Vertoe <vertoe AT qhor DOT net>
# Contributor: Viliam Kubis <viliam dot kubis at gmail dot com>

pkgbase=darkcoin-pkgbase-git
_gitname='darkcoin'
_gitbranch='master'
pkgname=('darkcoin-daemon-git' 'darkcoin-cli-git' 'darkcoin-qt-git')
pkgver=6008.b329a2f
pkgrel=1
arch=('any')
url="https://www.darkcoin.io"
makedepends=('boost' 'automoc4' 'qrencode' 'miniupnpc' 'protobuf')
license=('MIT')
conflicts=('darkcoin' 'darkcoin-git' 'darkcoil')
source=('git://github.com/darkcoin/darkcoin.git' 'darkcoin-qt.install')
sha256sums=('SKIP' 'ebf7090ca1202e2c2ccd1aa5bb03e6ac911c458141a1cedda9b41f9c26c2602c')

pkgver() {
  cd "$srcdir/$_gitname"
  git checkout "$_gitbranch" -q
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

prepare() {
  cd "$srcdir/$_gitname"
  git checkout "$_gitbranch"
}

build() {
  cd "$srcdir/$_gitname"
  ./autogen.sh
  ./configure --prefix=/usr --with-incompatible-bdb --with-gui=qt4 --disable-debug --disable-tests
  make
}

package_darkcoin-qt-git() {
  pkgdesc="An open sourced, privacy-centric digital currency. It allows you keep your finances \
    private as you make transactions, similar to cash - qt4"
  depends=(boost-libs qt4 miniupnpc qrencode protobuf)
  provides=(darkcoin-qt)

  install=darkcoin-qt.install

  cd "$srcdir/$_gitname"
  install -Dm755 src/qt/darkcoin-qt "$pkgdir"/usr/bin/darkcoin-qt
  install -Dm644 contrib/debian/darkcoin-qt.desktop \
    "$pkgdir"/usr/share/applications/darkcoin.desktop
  install -Dm644 share/pixmaps/darkcoin128.png \
    "$pkgdir"/usr/share/pixmaps/darkcoin128.png

  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

package_darkcoin-daemon-git() {
  pkgdesc="An open sourced, privacy-centric digital currency. It allows you keep your finances \
    private as you make transactions, similar to cash - daemon"
  depends=(boost-libs miniupnpc openssl)
  provides=(darkcoin-daemon)

  cd "$srcdir/$_gitname"
  install -Dm755 src/darkcoind "$pkgdir"/usr/bin/darkcoind
  #THESE ARE NOT READY UPSTREAM, BUT PRESERVE INTENT
  #install -Dm644 contrib/debian/examples/darkcoin.conf \
  #  "$pkgdir/usr/share/doc/$pkgname/examples/darkcoin.conf"
  #install -Dm644 contrib/debian/manpages/darkcoind.1 \
  #  "$pkgdir"/usr/share/man/man1/darkcoind.1
  #install -Dm644 contrib/debian/manpages/darkcoin.conf.5 \
  #  "$pkgdir"/usr/share/man/man5/darkcoin.conf.5
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

package_darkcoin-cli-git() {
  pkgdesc="An open sourced, privacy-centric digital currency. It allows you keep your finances \
    private as you make transactions, similar to cash - RPC client"
  depends=(boost-libs openssl)
  provides=(darkcoin-cli)

  cd "$srcdir/$_gitname"
  install -Dm755 src/darkcoin-cli "$pkgdir"/usr/bin/darkcoin-cli
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
