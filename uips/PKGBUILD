# Contributor: rabyte <rabyte__gmail>
# Contributor: Smith Dhumbumroong <zodmaner@gmail>

pkgname=uips
pkgver=1.03
pkgrel=1
pkgdesc="A commandline-based utility for creating and applying IPS patches"
arch=('i686' 'x86_64')
url="http://www.neillcorlett.com/uips/"
license=('GPL3')
depends=('glibc')
source=(http://www.neillcorlett.com/downloads/cmdpack-1.03-src.tar.gz)
md5sums=('79f62f20dc5ccb68d9a130e17798bb7f')

build() {
  cd $srcdir/cmdpack-$pkgver-src/src

  gcc ${CFLAGS} uips.c -o uips || return 1
}

package() {
  cd $srcdir/cmdpack-$pkgver-src/src

  install -m755 -D uips $pkgdir/usr/bin/uips
}