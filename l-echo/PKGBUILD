# Contributor: totoloco <totoloco at gmail dot com>
pkgname=l-echo
pkgver=0.4.3_r108
pkgrel=2
pkgdesc="open source echochrome clone, an optical illusion game"
arch=('i686' 'x86_64')
url="http://code.google.com/p/l-echo/"
license=('GPL3')
source=(http://l-echo.googlecode.com/files/$pkgname-$pkgver-src.zip l-echo.sh)
md5sums=('ebfd657b8f73c50dc299aae88455aa3b' '67cccf1bc7af00625147e4c02e622c62')
depends=('openal' 'freealut' 'freeglut')
makedepends=('gcc')

build() {
  cd $srcdir
  make || return 1
  install -Dm0755 l-echo.sh $pkgdir/usr/bin/l-echo || return 1
  install -Dm0755 l-echo $pkgdir/usr/share/l-echo/l-echo || return 1
  install -Dm0644 L_ECHO_README $pkgdir/usr/share/l-echo/README || return 1
  install -Dm0644 *.xml $pkgdir/usr/share/l-echo/ || return 1
  install -Dm0644  n-echo_template/apps/n-echo/*.xml.real $pkgdir/usr/share/l-echo/
}
