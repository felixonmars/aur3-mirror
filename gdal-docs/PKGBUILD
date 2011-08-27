# Contributor: Alexander 'hatred' Drozdov <hatred@inbox.ru>

pkgname=gdal-docs
_pkgname=gdal
pkgver=1.7.2
pkgrel=2
pkgdesc="Man pages and documentation for GDAL library"
arch=('any')
url="http://www.gdal.org/"
license=('custom:gdal')
depends=('gdal')
makedepends=('cfitsio' 'doxygen')
changelog=ChangeLog
options=('!libtool' '!makeflags')
source=(http://download.osgeo.org/${_pkgname}/${_pkgname}-${pkgver}.tar.gz)
md5sums=('05351f8cb61761ae579667e24a297fe6')

build() {
  cd ${srcdir}/$_pkgname-$pkgver

  ./configure --prefix=/usr --with-netcdf --with-libtiff --with-sqlite3 \
              --with-geotiff --with-mysql --with-python --without-libtool --with-curl

  make docs
  (cat Doxyfile ; \
   echo "ENABLED_SECTIONS=man"; \
   echo "INPUT=apps swig/python/scripts"; \
   echo "FILE_PATTERNS=*.cpp *.dox"; \
   echo "GENERATE_HTML=NO"; \
   echo "GENERATE_MAN=YES") | doxygen -
  make DESTDIR=${pkgdir} install-docs install-man

  mv     ${pkgdir}/usr/doc            ${pkgdir}/usr/share/
  mv     ${pkgdir}/usr/share/gdal/man ${pkgdir}/usr/share/
  rm -rf ${pkgdir}/usr/share/gdal
}
