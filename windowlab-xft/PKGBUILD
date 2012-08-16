pkgname=windowlab-xft
pkgver=1.40
pkgrel=1
pkgdesc="A small and simple window manager."
url="http://nickgravgaard.com/windowlab/"
license=('GPL')
depends=('xorg-server' 'libxft' 'libxext')
arch=('i686' 'x86_64')
conflicts=('windowlab')
source=("http://www.nickgravgaard.com/windowlab/windowlab-${pkgver}.tar" "xft.patch")
md5sums=('346f8c187838a446b4cbb2326d035577' 'bb32ccf4a3a88656869c924df4d38706')

build() {
  cd ${srcdir}/windowlab-${pkgver}

  patch < ../xft.patch
  make PREFIX=/usr
}

package() {
  cd ${srcdir}/windowlab-${pkgver}

  make PREFIX=/usr CONFPREFIX="" MANDIR=${pkgdir}/usr/share/man/man1 DESTDIR=${pkgdir} install
}
