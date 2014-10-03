# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Jason Melton <jason.melton@gmail.com>

pkgname=downtimed
pkgver=0.6
pkgrel=1
arch=(i686 x86_64)
pkgdesc="System downtime monitoring and reporting tool"
url="http://dist.epipe.com/downtimed"
license=(BSD)
install=downtime.install
source=(http://dist.epipe.com/${pkgname}/${pkgname}-${pkgver}.tar.xz)
md5sums=('3c85188f257401cb6aadb5f4e06e262b')


build() {
  cd ${srcdir}/${pkgname}-${pkgver}

  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}

  make DESTDIR=${pkgdir} install

  # needs a persistent data directory for the time stamp and the downtime database files
  mkdir -p ${pkgdir}/var/lib/downtimed
}

# vim: ts=2: ft=sh
