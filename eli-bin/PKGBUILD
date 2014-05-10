# Maintainer: perlawk

pkgname=eli-bin
pkgver=0.2
pkgrel=1
pkgdesc="Eli: an ASCII version of APL. Binary version only"
url="http://fastarray.appspot.com/default.html"
arch=('any')
license=('custom')
depends=()
provides=('elix')

package() {
  cd "$srcdir/eli_linux"
  install -Dm755 elix      "$pkgdir/usr/bin/elix"
}
source=("http://fastarray.appspot.com/res/eli_linux.zip")
md5sums=('1588ec9bbca7d6fd0bfa53f3d49927f4')
