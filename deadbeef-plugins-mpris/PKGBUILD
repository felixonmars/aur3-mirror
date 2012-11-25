# Contributor: HuangCongyu <huangcongyu2006 [at] gmail [dot] com>
# Maintainer.: HUANG Jiaqi <wanderhuang [at] gmail [dot] com>

pkgname=deadbeef-plugins-mpris
_prjname=deadbeef-MPRIS-plugin
pkgver=2.1.5
pkgrel=1
pkgdesc="MPRIS plugin for DeaDBeeF music player"
arch=("i686" "x86_64")
license=('GPL')
url="http://code.google.com/p/deadbeef-mpris-plugin"
depends=('deadbeef')
source=("http://${_prjname}.googlecode.com/files/${_prjname}-${pkgver}.tar.gz"
		"http://kode54.net/deadbeef-MPRIS-plugin-2.1.5-glibfix.patch.gz")
md5sums=("a12fdee72bb453bb343b1678d1f05b01"
		 "bc39dc43ff2e782022f6bed06ceb52c2")

build() {
#  mkdir -p ${srcdir}/${pkgname}
  tar xf deadbeef-MPRIS-plugin-${pkgver}.tar.gz -C ${srcdir}/
  cd "${srcdir}/deadbeef-${pkgver}"
  zcat ../deadbeef-MPRIS-plugin-2.1.5-glibfix.patch.gz | patch -p1 
  ./configure --prefix=/usr
  make
  make DESTDIR="${pkgdir}" install
}
