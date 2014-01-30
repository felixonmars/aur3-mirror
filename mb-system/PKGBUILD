# Maintainer: Ethan Zonca <ethanzonca@ethanzonca.com>

pkgname=mb-system
pkgrel=1
pkgver=2014.01.29
pkgdesc="Package for the processing and display of bathymetry and backscatter imagery data derived from multibeam, interferometry, and sidescan sonars."
arch=('i686' 'x86_64')
license=("GPL3")
url="http://www.ldeo.columbia.edu/res/pi/MB-System/"
depends=("netcdf" "proj" "gmt4")
makedepends=("svn")

source=("$pkgname::svn+svn://svn.ilab.ldeo.columbia.edu/repo/mb-system/trunk")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/repo"
  local ver="$(svnversion)"
  printf "r%s" "${ver//[[:alpha:]]}"
}

build() {
  cd ${srcdir}/${pkgname}
  ./configure --prefix=/usr --with-gmt-include=/usr/include/gmt/
  make clean
  make
}

package() {
  cd ${srcdir}/${pkgname}
  make DESTDIR=${pkgdir} install
}
