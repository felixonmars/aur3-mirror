# Contributor: twa022 <twa022@gmail.com>

pkgname=gmyth-upnp
pkgver=0.7.1
pkgrel=1
url="http://sourceforge.net/projects/gmyth/"
pkgdesc="Library to access MythTV backend services."
arch=(i686 x86_64)
license=('GPL2')
depends=('gmyth' 'libupnp' 'clinkc')
makedepends=()
source=(http://downloads.sourceforge.net/sourceforge/gmyth/${pkgname}-${pkgver}.tar.gz)
md5sums=('f569d565c9cb12d50e88d23a603c7fcb')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr || return 1
  make || return 1
  make DESTDIR="${pkgdir}" install || return 1
}
