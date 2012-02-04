# Contributor: zeus <gelios@gmail.com>

pkgname=linuxdcpp-ru
pkgver=070717 
_pkgver='07-07-17'
pkgrel=1
pkgdesc="Linux dc++ from CVS with encoding and magnet links support patchset"
url="http://linuxdcpp-ru.sourceforge.net/"
license="GPL"
depends=('libglade' 'bzip2' 'openssl')
makedepends=('scons')
arch=(i686 x86_64)

source=("http://linuxdcpp-ru.sourceforge.net/linuxdcpp-cvs_${_pkgver}.tbz" "http://linuxdcpp-ru.sourceforge.net/linuxdcpp-magnets_20${_pkgver}.patch" 'linuxdcpp.desktop')

md5sums=('298557bb640e9ad9717afd1bafb32cc7'
         'dee37602631b1bf4f21658cebde1d917'
         '6ae7e9bc66a7173e5b88158135efa281')

build() {
  cd $startdir/src/linuxdcpp
  patch -Np1 -i ../linuxdcpp-magnets_20${_pkgver}.patch || return 1
  scons PREFIX=/usr LIBDIR=/usr/share || return 1
  scons PREFIX=/usr LIBDIR=/usr/share install FAKE_ROOT=$startdir/pkg || return 1
  install -D ../../linuxdcpp.desktop $startdir/pkg/usr/share/applications/linuxdcpp.desktop
}
