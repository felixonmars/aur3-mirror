# Contributor: Moritz Heidkamp <moritz.heidkamp@bevuta.com>
pkgname="mshaper"
pkgver=0.7
pkgrel=1
pkgdesc="A traffic shaper and prioritizer designed specifically for DSLs, in particular the variety using PPPoE on top of G.922.1."
arch=(i686 )
arch=('i686' 'x86_64')
url="http://mshaper.florz.de/"
license=('GPL')
source=(http://mshaper.florz.de/${pkgname}_${pkgver}.tar.gz)
md5sums=('a3f6d319a857e1d9f794fa66cc925ff4')

build() {
  mkdir -p "${startdir}/pkg/usr/sbin"
  cd "${startdir}/src/${pkgname}-${pkgver}"
  make DESTDIR="${startdir}/pkg" PREFIX="/usr" install
}

# vim:set ts=2 sw=2 et:
