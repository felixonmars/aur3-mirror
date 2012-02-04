# Maintainer: Taylor Venable <taylor@metasyntax.net>

pkgname='bigloo-lib3'
pkgver='0.11'
pkgrel=1
pkgdesc="Collection of libraries for Bigloo, the Scheme programming language compiler"
arch=('i686' 'x86_64')
url='http://code.google.com/p/bigloo-lib3/'

# I could not find anywhere that the license is explicitly and directly stated.
# Files are under either GPL2+ or LGPL2+ while the project is labelled MIT.

license=('MIT' 'GPL2' 'LGPL2')
depends=('bigloo')
source=("http://bigloo-lib3.googlecode.com/files/${pkgname}-${pkgver}.tar.gz"
        'configure.patch')
md5sums=('efad854c823c04b0203c4edee022deb4'
         '6a54d7666d2410a6392b2df0085a11fa')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  patch < "${startdir}/configure.patch"
  ./configure --with-gd=no --with-curl=no
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="$pkgdir" install
}
