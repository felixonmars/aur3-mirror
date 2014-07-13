# Maintainer: speps <speps at aur dot archlinux dot org>

pkgname=qmidictl
pkgver=0.1.1
pkgrel=1
pkgdesc="A MIDI remote controller application that sends MIDI data over the network, using UDP/IP multicast."
arch=(i686 x86_64)
url="http://qmidictl.sourceforge.net/"
license=('GPL')
depends=('qt5-base' 'hicolor-icon-theme')
install="$pkgname.install"
source=("http://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgver/$pkgname-$pkgver.tar.gz")
md5sums=('87cfe217343be025a985acbab0934e43')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
