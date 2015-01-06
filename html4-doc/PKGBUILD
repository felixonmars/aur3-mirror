# Maintainer: Ondrej Kucera <ondrej.kucera@centrum.cz>

pkgname=html4-doc
pkgver=19991224
pkgrel=2
pkgdesc="HTML 4 Specification"
arch=('i686' 'x86_64')
url="http://www.w3.org/TR/html4/"
license=('W3C')
options=('docs')
source=("http://www.w3.org/TR/1999/REC-html401-19991224/html40.tgz")
md5sums=('1ed76627ba80816079649f67023ec7ab')

package() {
  cd "$srcdir"
  mkdir -p "$pkgdir/usr/share/doc/html4"
  cp -rf * "$pkgdir/usr/share/doc/html4"
  rm "$pkgdir/usr/share/doc/html4/html40.tgz"
}
