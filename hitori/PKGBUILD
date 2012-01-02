# Maintainer: György Balló <ballogy@freestart.hu>
pkgname=hitori
pkgver=0.3.1
pkgrel=1
pkgdesc="GTK+ application to generate and let you play games of Hitori"
arch=('i686' 'x86_64')
url="https://live.gnome.org/Hitori"
license=('GPL')
depends=('gtk3' 'hicolor-icon-theme' 'xdg-utils')
makedepends=('intltool' 'gnome-doc-utils')
install=$pkgname.install
source=(http://ftp.gnome.org/pub/GNOME/sources/$pkgname/${pkgver%.*}/$pkgname-$pkgver.tar.xz)
sha256sums=('8b8e360f7fd60fcf68eeecbf7a54c8f0a8e59723d1d5a39dd6335778f1d2bbf2')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
