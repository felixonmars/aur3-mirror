# Maintainer : SpepS <dreamspepser at yahoo dot it>
# Contributor: Jonathan Lestrelin <zanko@daemontux.org>

pkgname=grilo
pkgver=0.1.17
pkgrel=1
pkgdesc="A framework focused on making media discovery and browsing easy for application developers."
arch=('i686' 'x86_64')
url="http://www.clutter-project.org"
license=('LGPL')
depends=('libsoup' 'gtk3')
makedepends=('vala')
options=('!libtool')
source=("http://ftp.gnome.org/pub/GNOME/sources/$pkgname/${pkgver%.*}/$pkgname-$pkgver.tar.bz2")
sha256sums=('cb43f5856b9593a47e00c6e77adbf211df1880ae7bbaa1067f7a4285676f3df9')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr \
              --enable-static=no
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
