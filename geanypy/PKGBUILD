# $Id$
# Maintainer: Sagar Chalise <chalisesagar@gmail.com>
pkgname=geanypy
pkgver=0.21
pkgrel=4
pkgdesc="Python bindings for Geany Plugin API and plugins."
arch=('x86_64' 'i686')
url="http://codebrainz.github.com/geanypy"
license=('GPL2')
depends=('geany' 'python2' 'pygtk')
makedepends=('intltool' 'libtool')
source=("http://github.com/codebrainz/geanypy/tarball/master")
md5sums=('d849fec7fae9cb38f575eb510e0d3f19')

build() {
  cd "$srcdir/codebrainz-geanypy-bceef6e/"
  ./autogen.sh
  ./configure --prefix=`pkg-config --variable=prefix geany` PYTHON_VERSION=2.7
  make 
}

package() {
  cd "$srcdir/codebrainz-geanypy-bceef6e/"
  make DESTDIR="$pkgdir" install
}
