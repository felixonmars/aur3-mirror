# Contributor: Anton Bazhenov <anton.bazhenov at gmail>

pkgname=grib_def
pkgver=1.9.16
pkgrel=3
pkgdesc="Definition files for GRIB API"
arch=('any')
url="http://www.ecmwf.int/products/data/software/grib_api.html"
license=('LGPL3' 'GPL3')
depends=('grib_api')
source=(${url/g*/}/download/software_files/grib_api-$pkgver.tar.gz)
md5sums=('f1288627031c97fa1631fd5a63e3bbb3')

build() {
  cd "$srcdir"/grib_api-$pkgver
  sed -i configure -e 's|share/samples|share/grib_api/samples|'
  sed -i configure -e 's|python python2|python2 python|'
  ./configure F77="gfortran" FC="gfortran" CPPFLAGS="$CPPFLAGS -fPIC" \
      --prefix=/usr --enable-python --with-png-support \
      --with-netcdf=/usr --datadir=/usr/share/grib_api \
      --datarootdir=/usr/share/grib_api/definitions || return 1
  cd definitions && make DESTDIR="$pkgdir" install || return 1
}
