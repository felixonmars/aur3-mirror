# Maintainer: Florian Léger <florian6 dot leger at laposte dot net>

pkgname=biounzip
pkgver=1.1a
_dirver=1.1
pkgrel=1
pkgdesc='Tool to decompress BioZip (.bzf) files.'
arch=('i686' 'x86_64')
url='http://biounzip.sourceforge.net/'
license=('GPL')
depends=('zlib')
source=("http://downloads.sourceforge.net/project/${pkgname}/${pkgname}/Biounzip%201.1%20beta/${pkgname}-${pkgver}.tar.bz2"
        "biounzip-makefile.diff")
md5sums=('3f6bafc12d07ae251788e24c7a23a93a'
         '960041487c1a6da717f8a64565b35dd6')

build() {
  cd ${srcdir}/
  patch -p0 < biounzip-makefile.diff || return 1
  cd ${pkgname}-${_dirver}
  make || return 1
  install -D -m755 biounzip ${pkgdir}/usr/bin/biounzip || return 1
}

