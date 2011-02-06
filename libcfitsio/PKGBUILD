# Contributor: Lawrence Lee <valheru AT facticius DOT net>
# Contributor: Nicolas Barbey <nicolas DOT a DOT barbey AT gmail DOT com >
pkgname=libcfitsio
pkgver=3.250
_pkgver=3250
pkgrel=1
pkgdesc="http://heasarc.gsfc.nasa.gov/docs/software/fitsio/fitsio.html"
arch=('i686' 'x86_64')
url="http://heasarc.nasa.gov/lheasoft/fitsio/fitsio.html"
license=('GPL')
source=("ftp://heasarc.gsfc.nasa.gov/software/fitsio/c/cfitsio$_pkgver.tar.gz")
md5sums=('1e6e390f21fab4e04781156fddcd2f8b')

build() {
  cd "$startdir/src/cfitsio"

  ./configure --prefix=/usr
  make shared || return 1
  make || return 1
  #install -D -m755 libcfitsio.so $startdir/pkg/lib
  #install -D -m755 libcfitsio.a $startdir/pkg/lib 
  #install -D -m644 fitsio.h $startdir/pkg/include
  make prefix=$pkgdir/usr install
}

# vim:set ts=2 sw=2 et:
