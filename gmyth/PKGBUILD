# Contributor: twa022 <twa022@gmail.com>

pkgname=gmyth
pkgver=0.7.1
pkgrel=1
url="http://sourceforge.net/projects/gmyth/"
pkgdesc="Library to access MythTV backend services."
arch=(i686 x86_64)
license=('GPL2')
depends=('libmysqlclient' 'curl')
makedepends=()
source=(http://downloads.sourceforge.net/sourceforge/${pkgname}/${pkgname}-${pkgver}.tar.gz)
md5sums=('ab6b7525fd9c71cf5203f9e61abec0c3')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr || return 1
  make || return 1
  make DESTDIR="${pkgdir}" install || return 1
}
