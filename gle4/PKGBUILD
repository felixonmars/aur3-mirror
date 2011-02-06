# Contributor: Your Name <youremail@domain.com>
pkgname=gle4
pkgver=4.0.12
pkgrel=1
pkgdesc="GLE is a graphics language that produces PostScript, EPS, PDF, PNG, or JPG ouput from a simple script file."
arch=('i686')
url="http://glx.sourceforge.net/"
license=('BSD')
depends=('qt4>=4.1.1' 'libtiff')
makedepends=('gcc')
source=(http://prdownloads.sourceforge.net/glx/GLE-$pkgver-src.zip)
md5sums=('3eff3d16a99b24a9e0a64628bdb94b94')

build() {
  cd "$startdir/src/gle4"

  ./configure --prefix=/usr --with-x --with-qt=/opt/qt4
  make || return 1
  make DESTDIR="$startdir/pkg" install
}

# vim:set ts=2 sw=2 et:
