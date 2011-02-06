# Maintainer: David Rosenstrauch <darose@darose.net>
pkgname=podencoder
pkgver=0.20070117.0
pkgrel=1
pkgdesc="The flexible video encoder for iPods and other devices"
arch=('any')
url="http://code.google.com/p/podencoder/"
license=('GPL')
groups=()
depends=('mplayer' 'gpac')
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(http://podencoder.googlecode.com/svn/trunk/$pkgname)
noextract=()
md5sums=('41ade31697201d9717cd994af666cbbf') #generate with 'makepkg -g'

#build() {
#  cd "$srcdir/$pkgname-$pkgver"
#
#  ./configure --prefix=/usr
#  make
#}

package() {
  cd "$srcdir"

  install -D -m 755 $pkgname ${pkgdir}/usr/bin/$pkgname
}
