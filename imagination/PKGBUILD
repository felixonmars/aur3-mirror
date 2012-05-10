# Contributor: Asa Marco <marcoasa90[at]gmail[dot]com>

pkgname=imagination
pkgver=3.0
pkgrel=3
pkgdesc="Imagination is a lightweight and simple DVD slideshow maker in GTK+2"
arch=('i686' 'x86_64')
url="http://imagination.sourceforge.net/"
license=('GPL')
depends=('gtk2' 'ffmpeg' 'sox')
makedepends=('intltool' 'docbook-xsl')
provides=('imagination')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('ec7e6cf234020801a2af0fa04cfefef1')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i 's/PLUGINS_INSTALLED 0/PLUGINS_INSTALLED 1/g' src/support.h
  LDFLAGS="-lm -lgmodule-2.0" ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
