# Maintainer : SpepS <dreamspepser at yahoo dot it>
# Contributor: Daniele Paolella <danielepaolella@email.it>
# Contributor: Philipp Überbacher <murks at lavabit dot com>

pkgname=ll-plugins
pkgver=0.2.8
pkgrel=3
pkgdesc="A lv2 host and a collection of lv2 plugins by Lars Luthman"
arch=('i686' 'x86_64')
url="http://ll-plugins.nongnu.org/index.html"
license=('GPL3')
depends=('lv2-c++-tools' 'lash' 'jack')
source=("http://download.savannah.nongnu.org/releases/ll-plugins/$pkgname-$pkgver.tar.bz2")
md5sums=('56e7f4a62fce6b22b4acdb02ba06669c')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix="/usr"
  make LDFLAGS="$LDFLAGS -ldl"
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
