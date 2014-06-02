# Maintainer: Calimero <calimeroteknik@free.fr>
# Maintainer: Marti Raudsepp <marti@juffo.org>

pkgname=pg_top
pkgver=3.7.0
pkgrel=1
pkgdesc='top-like app for monitoring PostgreSQL backends (previously known as ptop)'
arch=('i686' 'x86_64')
license=('BSD')  # original BSD license
url='http://ptop.projects.postgresql.org/'
depends=('postgresql-libs')
source=("http://pgfoundry.org/frs/download.php/3504/$pkgname-$pkgver.tar.bz2")
md5sums=('4d0c61a1aaa32f815d2e2452513fbfec')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="$pkgdir" install
  install -d -m755 "${pkgdir}/usr/share/doc/${pkgname}/"
  install -D -m644 README HISTORY FAQ "${pkgdir}/usr/share/doc/${pkgname}/"
}
