# Maintainer: Megameneer (Dennis Holierhoek) <dennis.hh@hotmail.com>
pkgname=caltotxt
pkgver=2.0.2
pkgrel=1
pkgdesc="A utility to convert text documents for the QWERTY text editor for the Texas Instruments TI-83+, TI-84+ and 84SE graphical calculators to plain text files"
arch=('any')
url=http://www.ticalc.org/archives/files/fileinfo/213/21372.html
license=('FreeBSD')
depends=()
makedepends=('gcc')
source=(https://archive.org/download/CALTOTXTTXTTOCAL/qwertyconv.tar.gz)
md5sums=('d825fb3d67d2fd3018c999c815a909e6')
sha256sums=('52d9d3c0efef8cfdd37adf5086df4da35832c8386378e1171f590366de06b08e')

build() {
  cd ${srcdir}
  tar -xvzf qwertyconv.tar.gz
  cd qwertyconv
  g++ CALTOTXT.CPP -o caltotxt
}

package() {
	install ${srcdir}/qwertyconv/caltotxt -D ${pkgdir}/usr/bin/caltotxt
}
