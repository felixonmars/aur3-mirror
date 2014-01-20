# Maintainer: archtux <antonio dot arias99999 at gmail dot com>

pkgname=ttx
pkgver=0.0.5
pkgrel=1
pkgdesc="Teletext-browser with support for Dutch, Belgian, Austrian, German, Portuguese, Finnish, Spanish and Italian teletext services"
arch=('i686' 'x86_64')
url="http://code.google.com/p/ttx-teletext/"
license=('GPL3')
depends=('gtk3' 'libsoup')
makedepends=('intltool')
install=ttx.install
source=(http://ttx-teletext.googlecode.com/files/ttx-$pkgver.tar.gz)
md5sums=('12c7277c9c858c6adb7b27dfed06c241')

prepare() {
  cd $srcdir/$pkgname-$pkgver

  # Fix desktop file
  sed -i "s|Comment=Application for viewing Teletext on your desktop|GenericName=Teletext Browser|" ttx-gtk.desktop.in

  ./configure --prefix=/usr
}

build() {
  cd $srcdir/$pkgname-$pkgver
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
}