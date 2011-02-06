# Maintainer: Sebastian Pająk <sp.0x01@gmail.com>

pkgname=openldev
pkgver=1.0
pkgrel=1
pkgdesc="Graphical front-end to various Linux development tools such as gcc, autotools and make"
arch=(i686 x86_64)
depends=('vte>=0.16.0' 'libgnomeui>=2.20.0' 'libgnomeprintui>=2.18.0' 'gtksourceview>=1.8.0')
makedepends=('pkgconfig')
url="http://www.openldev.org/"
license=(GPL)
source=(http://mesh.dl.sourceforge.net/sourceforge/openldev/${pkgname}-${pkgver}.tar.bz2)
md5sums=('e5345d18b6f7cafcac85e3ce66b33217')

build() {
  cd ${startdir}/src/${pkgname}
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=${startdir}/pkg install
  rm -f ${startdir}/pkg/usr/lib/libopenldev.la
}
