# Maintainer: Moritz Heidkamp <moritz@twoticketsplease.de>
# Based on the guile-git PKGBUILD

pkgname=guile2
pkgver=2.0.9
pkgrel=3
pkgdesc="A portable, embeddable Scheme implementation"
url="http://www.gnu.org/software/guile/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('gc' 'gmp>=4.3.1' 'gperf' 'libffi' 'libtool'
         'libunistring>=0.9.3' 'ncurses>=5.7' 'texinfo')
provides=("guile=$pkgver")
conflicts=('guile' 'guile-devel' 'guile-git')
options=('!strip')
source=("ftp://ftp.gnu.org/gnu/guile/guile-${pkgver}.tar.gz")
sha1sums=('fc5d770e8b1d364b2f222a8f8c96ccf740b2956f')

build() {
  cd guile-${pkgver}
  ./configure --prefix=/usr --disable-error-on-warning
  make LDFLAGS+="-lpthread"
}

package() {
  cd guile-${pkgver}
  make DESTDIR="$pkgdir/" install
}
