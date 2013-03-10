# Maintainer: speps <speps at aur dot archlinux dot org>

pkgname=midisnoop
pkgver=0.1.2
pkgrel=1
pkgdesc="MIDI monitor and probing software"
arch=(i686 x86_64)
url="https://code.google.com/p/midisnoop/"
license=('GPL')
depends=('qt4' 'rtmidi')
makedepends=('python2')
install="$pkgname.install"
source=("https://midisnoop.googlecode.com/files/$pkgname-$pkgver.tar.gz")
md5sums=('ec295904a7df47d8c9d882004c3bacad')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  # use python2 and qmake-qt4
  sed -i 's/env python$/&2/' configure install/build-*
  sed -i 's/"qmake"/"qmake-qt4"/' configure

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make INSTALL_ROOT="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
