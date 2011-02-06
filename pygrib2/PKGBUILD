# Contributor: Stéphane Gaudreault <stephane@archlinux.org>
pkgname=pygrib2
pkgver=20090105
pkgrel=2
pkgdesc="Python module for reading and writing GRIB edition 2 files."
arch=('i686' 'x86_64')
url="http://code.google.com/p/pygrib2"
license=('custom')
source=(http://pygrib2.googlecode.com/files/${pkgname}-${pkgver}.tar.gz)
md5sums=('0b74036798fdc65d9015429476a867e8')
depends=('pyproj' 'python2' 'jasper' 'python2-numpy' 'libpng' 'zlib')
makedepends=('python2-distribute')

package() {
   cd "${srcdir}/${pkgname}-${pkgver}"

   export JASPER_DIR=/usr
   export PNG_DIR=/usr
   export ZLIB_DIR=/usr

   python2 setup.py install --prefix=/usr --root=$startdir/pkg

   install -dm755 ${pkgdir}/usr/share/licenses/${pkgname}
   install -m644 README.txt ${pkgdir}/usr/share/licenses/${pkgname}/
}
