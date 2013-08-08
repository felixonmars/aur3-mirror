# Contributor: Jose San Juan <sanjuan@tng.iac.es>
# Maintainer: <clu>

pkgname=ccfits
_pkgname=CCfits
pkgver=2.4
pkgrel=3
pkgdesc="Object Oriented Interface to the CFITSIO Library"
url="http://heasarc.gsfc.nasa.gov/docs/software/fitsio/ccfits/"
license="special (NASA)"
depends=("cfitsio")
arch=('i686' 'x86_64')
source=(http://heasarc.gsfc.nasa.gov/docs/software/fitsio/ccfits/CCfits-${pkgver}.tar.gz)
md5sums=('dd9a11d964590dd5f3fd5a3491b2c1ce')

build() {
  unset LDFLAGS
  cd ${srcdir}/${_pkgname}
  ./configure --with-cfitsio-libdir=/usr/lib --prefix=/usr 
  make 
}

package() {
  cd ${srcdir}/${_pkgname}
  make DESTDIR=${pkgdir} install
  #install license.
  install -D -m644 License.txt "${pkgdir}/usr/share/licenses/${_pkgname}/License.txt"
}
