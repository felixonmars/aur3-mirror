# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
pkgname=tastystatic
pkgver=1
pkgrel=2
pkgdesc="clone of an excellent PC oldie called Skyroads where you go really fast and get annoyed a lot"
arch=('i686' 'x86_64')
url="http://www.tastystatic.com"
license=('unknown')
depends=('audiere' 'sdl')
source=("tastystatic" "http://178.63.102.135/svens_stuff/tasty32.tar.gz")
md5sums=('0bd54e2da6439297528c2d44d7ab737f' 'f64ab405699a7470991295df66e45515')
# handle x86_64 arch below
_arch='32'
[ "$CARCH" == "x86_64" ] && source=("tastystatic" "http://178.63.102.135/svens_stuff/tasty64.tar.gz")
[ "$CARCH" == "x86_64" ] && md5sums=('0bd54e2da6439297528c2d44d7ab737f' '8b1277a76d7c614552fce0f16cab6a07')
[ "$CARCH" == "x86_64" ] && depends=('lib32-sdl')
[ "$CARCH" == "x86_64" ] && _arch='64'

build() { 
  install -dm755 ${pkgdir}/usr/share/${pkgname}
  cp -r ${srcdir}/tasty${_arch}/* ${pkgdir}/usr/share/${pkgname}

  install -Dm755 ${srcdir}/tastystatic ${pkgdir}/usr/bin/tastystatic
}

# vim: ts=2 sw=2 et ft=sh
