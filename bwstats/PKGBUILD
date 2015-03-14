# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Ron Collinson <notthinking@gmail.com>
# Contributor: Rafael G. Martins <rafael@rafaelmartins.com>
# Contributor: Alexander Mieland (dma147) <dma147@linux-stats.org>

pkgname=bwstats
pkgver=0.1.0
pkgrel=3
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/bwstats.berlios/"
license=('GPL')
pkgdesc="daemon which grabs bandwidth data and generates a flow chart diagram"
depends=('gd' 'libpng')
source=(http://downloads.sourceforge.net/project/$pkgname.berlios/$pkgname-$pkgver.tar.bz2)
md5sums=('316669381c644aefb25c7cc7b2b40fdc')


build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  ./configure --prefix=/usr --with-gd
  CFLAGS="${CFLAGS} -lgd" make CFLAGS="${CFLAGS} -lgd"
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make DESTDIR=${pkgdir} PREFIX=${pkgdir} install
}
