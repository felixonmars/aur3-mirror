# Contributor: Nathan Owe <ndowens.aur at gmail dot com>

pkgname=dap-server
pkgver=4.1.2
pkgrel=1
arch=(i686 x86_64)
pkgdesc="OpenDAP general purpose handlers used by Hyrax."
url="http://www.opendap.org/download/general_purpose_handlers.html"
license="LGPL"
depends=('libdap' 'perl' 'bes')
options=('!libtool')
source=(http://www.opendap.org/pub/source/${pkgname}-${pkgver}.tar.gz)
md5sums=('52f09b0e0da4e015d3c2892f42739aba')


build() {
  cd ${srcdir}/${pkgname}-${pkgver}

  ./configure --prefix=/usr
  make 
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}

  make prefix=${pkgdir}/usr install
}
