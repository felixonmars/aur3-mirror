# Maintainer: Kyle <kyle@gmx.ca>
pkgname=picospeaker
pkgver=0.7
pkgrel=1
pkgdesc="Speak text on the command line or from standard input using SVox Pico and Sox"
arch=('any')
url="http://www.picospeaker.tk"
license=('custom: UNLICENSE')
groups=()
depends=('python2' 'svox-pico-git' 'sox')
source=("http://www.picospeaker.tk/files/$pkgname-$pkgver.tar.bz2")
md5sums=('4b31f053cff59ebe14079544dbb343ac')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i 's|#!/usr/bin/python|#!/usr/bin/python2|' ${pkgname}
  install -Dm755 $pkgname $pkgdir/usr/bin/$pkgname
  install -Dm644 README $pkgdir/usr/share/doc/$pkgname/README
  install -Dm644 UNLICENSE $pkgdir/usr/share/licenses/$pkgname/UNLICENSE
}

# vim:set ts=2 sw=2 et:
