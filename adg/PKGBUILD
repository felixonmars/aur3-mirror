# Maintainer: speps <speps at aur dot archlinux dot org>

pkgname=adg
pkgver=0.8.0
pkgrel=1
pkgdesc="Automatic Drawing Generation is a set of functions focused on automating the drawing of mechanical parts."
arch=(i686 x86_64)
url="http://adg.entidi.com/"
license=('LGPL')
depends=('gtk3')
makedepends=('gtk-doc')
options=('!libtool')
source=("http://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgver/$pkgname-$pkgver.tar.bz2")
md5sums=('868cadd939a26af9b0a1ec7be7aea0c9')

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
