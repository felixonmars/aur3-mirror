# Contributor: Hubert Czobodziński <hcz@onet.eu>
pkgname=plr
pkgver=8.3.0.15
pkgrel=1
pkgdesc="PL/R - R procedural language for PostgreSQL"
arch=('i686' 'x86_64')
url="http://www.joeconway.com/plr"
license=('GPL')
depends=('postgresql>=8.4' 'r')
source=(http://www.joeconway.com/plr/${pkgname}-${pkgver}.tar.gz)
md5sums=('1cf83ccefb29e5b8174e3bcc5e82ac8c')

build() {
  cd ${srcdir}/${pkgname}
  export USE_PGXS=1
  make || return 1
}

package() {
  cd ${srcdir}/${pkgname}
  export USE_PGXS=1
  make DESTDIR=${pkgdir}/ install || return 1
}
