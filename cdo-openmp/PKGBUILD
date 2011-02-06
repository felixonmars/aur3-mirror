# Contributor: Ralf Mueller <stark.dreamdetective@gmail.com>
pkg=cdo
flavour=-openmp
pkgname=${pkg}${flavour}
pkgver=1.4.5.1
pkgrel=0
pkgdesc="CDO is a collection of command line Operators to manipulate and analyse Climate model Data. Supported data formats are GRIB, netCDF, SERVICE, EXTRA and IEG. There are more than 400 operators available."
url="http://code.zmaw.de/projetcs/cdo"
license="GPL"
depends=('netcdf' 'hdf5' 'proj')
makedepends=('netcdf' 'hdf5' 'proj')
provides=()
conflicts=()
replaces=()
arch=(i686 x86_64)
backup=()
install=
source=(https://code.zmaw.de/attachments/download/307/${pkg}-${pkgver}.tar.gz)
md5sums=('fe86f85725ba596a46e8b7fe16b74816')

build() {
  cd $startdir/src/$pkg-$pkgver/
  ./configure --prefix=/usr --with-netcdf=/usr --with-hdf5=/usr CFLAGS=-fopenmp
  make || return 1
  make DESTDIR=$startdir/pkg install || return 1
  rm -f $startdir/pkg/usr/bin/cdotest
}
