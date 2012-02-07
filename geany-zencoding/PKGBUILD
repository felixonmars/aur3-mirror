# $Id$
# Maintainer: Sagar Chalise <chalisesagar@gmail.com>
pkgname=geany-zencoding
pkgver=0.21
pkgrel=2
pkgdesc="Zen Coding plugin for geany"
arch=('x86_64' 'i686')
url="https://github.com/codebrainz/geany-zencoding"
license=('GPL2')
depends=('geany' 'python2')
makedepends=('intltool')
source=("https://github.com/codebrainz/geany-zencoding/tarball/master" "geany-zencoding.patch")
md5sums=('3995d99fb8fe7af35febc09821c3f0df'
         '010252ba0d88a4d1ab820942c1b23f44')

build() {
  cd "$srcdir/codebrainz-geany-zencoding-8d456b6/"
  patch -p1 -i ../geany-zencoding.patch
  ./autogen.sh
  ./configure --prefix=`pkg-config --variable=prefix geany`
  make 
}

package() {
  cd "$srcdir/codebrainz-geany-zencoding-8d456b6/"
  make DESTDIR="$pkgdir" install
}
