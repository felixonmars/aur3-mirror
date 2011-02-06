# Maintainer: Simplet <simplet AT ptigeek _DOT_ net>
pkgname=dumx
pkgver=2006
pkgrel=2
pkgdesc="Displays the largest files and/or directories in a given list of paths"
arch=('i686' 'x86_64')
url="http://dumx.sourceforge.net"
license=('GPL')
source=(dumx.tgz::http://prdownloads.sourceforge.net/dumx/dumx.tgz?download)
sha256sums=('11459a09d5c02af64b7f7f8d8a6a3f772f1689bd28b3144918db4efe5a7976fd')

build() {
  cd "$srcdir/dumx"
  make
}

package() {
  cd "$srcdir/dumx"

  # the original Makefile is static to /usr/local so I had to install manually...
  install -D -m755 dumx $pkgdir/usr/bin/dumx
  install -D -m755 dumx.1.gz $pkgdir/usr/share/man/man1/dumx.1.gz
}
