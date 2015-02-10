# Maintainer: Simon Klemenc <simon@booya.at>
pkgname=unoconv-git
pkgver=0.6.r26.g2a5cfb8
pkgrel=1
pkgdesc="A Python lib for OpenDocument (dual python2/python3)"
arch=('any')
url="https://github.com/dagwieers/unoconv"
license=('GPL')
depends=('python' 'libreoffice-still')
provides=('unoconv')
conflicts=('unoconv')
makedepends=('git' 'asciidoc' 'xmlto')
source=("$pkgname"::'git://github.com/dagwieers/unoconv.git')
# Because the sources are not static, skip Git checksum:
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}
package() {
  cd "$srcdir/$pkgname"
  make
  make install DESTDIR="$pkgdir/"
}


