pkgname=mingw32-libtiff-devel
pkgver=4.0.0beta7
pkgrel=1
pkgdesc="Library for manipulation of TIFF images, mingw32 port (beta)"
arch=('any')
url="http://www.remotesensing.org/libtiff/"
license=('custom')
depends=('mingw32-libjpeg>=7' 'mingw32-zlib')
makedepends=()
optdepends=('freeglut: for using tiffgt')
provides=(mingw32-libtiff)
conflicts=(mingw32-libtiff)
options=('!libtool' '!buildflags' '!strip')
source=(ftp://ftp.remotesensing.org/pub/libtiff/tiff-${pkgver}.tar.gz)
md5sums=('7a8252fbc6287ff2aa9b26062041a33e')

build() {
  cd "${srcdir}/tiff-${pkgver}"

  ./configure --prefix=/usr/i486-mingw32 --host=i486-mingw32 --sysconfdir=/usr/i486-mingw32/etc --mandir=/usr/i486-mingw32/share/man
  make
}

package() {
  cd "${srcdir}/tiff-${pkgver}"

  make DESTDIR="${pkgdir}" install

  install -D -m644 COPYRIGHT "${pkgdir}/usr/i486-mingw32/share/licenses/${pkgname}/LICENSE"
}
