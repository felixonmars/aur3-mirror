# Contributor: Graziano Giuliani <giuliani@lamma.rete.toscana.it>

pkgname=dap-netcdf-handler
pkgver=3.10.2
pkgrel=1
arch=(i686 x86_64)
pkgdesc="OpenDAP NetCDF file handler used by Hyrax."
url="http://www.opendap.org/download/nc_server.html"
license="LGPL"
depends=('libdap' 'bes')
options=('!libtool')
source=(http://www.opendap.org/pub/source/netcdf_handler-$pkgver.tar.gz)
md5sums=('3192f50f7b20deb15419cb9e8aad6f03')

build() {
  cd $srcdir/netcdf_handler-$pkgver

  FC=gfortran F77=gfortran ./configure --prefix=/usr
  make
}

package() {
  cd $srcdir/netcdf_handler-$pkgver

  make prefix=$pkgdir/usr install
}

