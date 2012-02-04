# Maintainer: Sigitas Mazaliauskas <sigisnn@gmail.com>

pkgname=nforenum
pkgver=4.0.0
pkgrel=1
pkgdesc="A tool for checking NFO code for errors, and for beautifying that code"
arch=('i686' 'x86_64')
url="http://dev.openttdcoop.org/projects/nforenum"
license=('GPL2')
makedepends=('boost')
optdepends=('grfcodec')
source=("http://binaries.openttd.org/extra/${pkgname}/${pkgver}/${pkgname}-${pkgver}-source.tar.gz")
md5sums=('9dd7ec02f14256ca65e648b5de415eea')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}-source"

  make || return 1
  make DESTDIR="${pkgdir}" install || return 1

} 
