# Maintainer: speps <speps at aur dot archlinux dor org>

pkgname=qmidinet
pkgver=0.2.0
pkgrel=1
pkgdesc="A MIDI Network Gateway via UDP/IP Multicast"
arch=(i686 x86_64)
url="http://qmidinet.sourceforge.net/"
license=('GPL')
depends=('qt5-base' 'jack' 'hicolor-icon-theme')
install="$pkgname.install"
source=("http://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgver/$pkgname-$pkgver.tar.gz")
md5sums=('a3bdfe7a53f0e4f0f5f69cf9799e057d')

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
