# Maintainer: Yosef Or Boczko <yosefor3@walla.com>

pkgname=gnome-online-miners
pkgver=3.9.5
pkgrel=1
pkgdesc="Crawls through your online content"
arch=('i686' 'x86_64')
url="http://git.gnome.org/browse/gnome-online-miners"
license=('GPL2+')
depends=('libgdata' 'glib2' 'gnome-online-accounts' 'grilo' 'tracker' 'libtracker-sparql' 'libzapojit')
makedepends=('git' 'gnome-common')
source=(ftp://ftp.gnome.org/pub/GNOME/sources/${pkgname}/${pkgver%.*}/${pkgname}-${pkgver}.tar.xz)
sha256sums=('4db124b5871c80109f5ac46c77c7b212bdf6751307917687016d713aae369512')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr --disable-static
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
