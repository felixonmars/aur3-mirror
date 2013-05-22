# Maintainer: Stefano Facchini <stefano.facchini@gmail.com>
pkgname=office-runner
pkgver=1.0.1
pkgrel=1
pkgdesc="Office game for laptop owners"
arch=('i686' 'x86_64')
url="http://www.gnome.org"
license=('GPL3')
depends=('gtk3' 'gnome-settings-daemon')
source=(http://ftp.gnome.org/pub/GNOME/sources/$pkgname/${pkgver:0:3}/$pkgname-$pkgver.tar.xz)
sha256sums=('bbb9932c414d58caf3e71656258a4f49218e42256d0349c6e44366345b23174b')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
