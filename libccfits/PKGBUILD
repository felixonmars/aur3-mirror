# Contributor: Jose San Juan <sanjuan@tng.iac.es>

pkgname=libccfits
pkgver=2.3
pkgrel=1
pkgdesc="Object Oriented Interface to the CFITSIO Library"
url="http://heasarc.gsfc.nasa.gov/docs/software/fitsio/fitsio.html"
license="special (NASA)"
depends=("cfitsio")
arch=("any")
source=(http://heasarc.gsfc.nasa.gov/docs/software/fitsio/ccfits/CCfits-$pkgver.tar.gz)
md5sums=('46bcd289012e6f6189f2a5fd6710f40f')

build() {
  unset LDFLAGS
  cd $srcdir/CCfits
  ./configure --with-cfitsio-libdir=/usr/lib  
  make || return 1
  make DESTDIR=$startdir/pkg install
}
