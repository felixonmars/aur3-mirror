# Maintainer: OmeGa <omega at mailoo dot org>
# Contributor: megadriver <megadriver at gmx dot com>

pkgname=mu-kiss
pkgver=0.9.9
pkgrel=3
pkgdesc="A collection of utilities for indexing and searching Maildirs (without mug)."
arch=('i686' 'x86_64')
url="http://www.djcbsoftware.nl/code/mu"
license=('GPL3')
depends=('gmime' 'xapian-core')
optdepends=('cronie: updating index regularly')
provides=('mu')            
conflicts=('mu')
install=$pkgname.install
source=(http://mu0.googlecode.com/files/mu-$pkgver.tar.gz)
sha1sums=('eafd678faf852230f55ae262ae005d006a9a839b')

build() {
  cd "$srcdir/mu-$pkgver"
  
  ./configure \
    --prefix=/usr \
    --with-gui=none
    
  make
}

package() {
  cd "$srcdir/mu-$pkgver"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
