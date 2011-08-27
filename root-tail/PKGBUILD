# Maintainer : SpepS <dreamspepser at yahoo dot it>
# Contributor:  John Sowiak <john@archlinux.org>

pkgname=root-tail
pkgver=1.2
pkgrel=6
pkgdesc="Displays logfiles in different colours on your root-window"
arch=('i686' 'x86_64')
url="http://www.goof.com/pcg/marc/root-tail.html"
license=('GPL')
depends=('libxext')
makedepends=('imake')
#source=("http://www.goof.com/pcg/marc/data/${pkgname}-${pkgver}.tar.gz") <== Seems to be down
source=("${pkgname}-${pkgver}.tar.gz")
md5sums=('5a4b3c4c7ab3bed1f4575e9688aac5de')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  xmkmf -a
  make
}

package () {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" MANPATH=/usr/share/man install install.man
}
