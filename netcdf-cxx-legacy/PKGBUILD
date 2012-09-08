# Contributor: Orlando Garcia Feal <rodland at gmail dot com>

pkgname=netcdf-cxx-legacy
pkgver=4.2
pkgrel=1
pkgdesc="Legacy NetCDF c++ bindings"
arch=('i686' 'x86_64')
url="http://www.unidata.ucar.edu/downloads/netcdf/netcdf-cxx/index.jsp"
depends=('gcc-libs' 'netcdf' 'curl')
license=('custom')
options=('!libtool' '!makeflags')
source=(http://www.unidata.ucar.edu/downloads/netcdf/ftp/netcdf-cxx-${pkgver}.tar.gz)
md5sums=('d32b20c00f144ae6565d9e98d9f6204c')

build() {
  cd ${srcdir}/netcdf-cxx-${pkgver}
  ./configure --prefix=/usr --enable-shared
  make
#  make check
}

package() {
  cd ${srcdir}/netcdf-cxx-${pkgver}

  install -m755 -d ${pkgdir}/usr/lib
  install -m755 -d ${pkgdir}/usr/share/man
  make DESTDIR=${pkgdir} install

  install -Dm644 ${srcdir}/netcdf-cxx-${pkgver}/COPYRIGHT \
        ${pkgdir}/usr/share/licenses/${pkgname}/COPYRIGHT

}