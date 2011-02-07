# Contributor: totoloco <totoloco [at] ushcompu.com.ar>
pkgname=nullpomino
pkgnameCamel=NullpoMino
pkgver=7.5.0
pkgver_=7_5_0
pkgrel=1
pkgdesc="An open-source action puzzle game that works on the Java platform. It has a wide variety of single-player modes and netplay to allow players to compete over the Internet or LAN."
arch=('any')
url="http://code.google.com/p/nullpomino/"
license=('BSD')
groups=()
depends=('java-runtime')
source=("http://nullpomino.googlecode.com/files/"$pkgnameCamel$pkgver"_linux.tar.gz" "nullpomino")
md5sums=('935f5b5bf8a10c048c0aba8714ff649a'
         '95947bb9908233bb24bd4e3da1db3741')

#build() {
#}

package() {
  mkdir -p $pkgdir/usr/share
  mkdir -p $pkgdir/usr/bin
  cp -R $srcdir/$pkgnameCamel$pkgver_ $pkgdir/usr/share/$pkgname
  chgrp -R games $pkgdir/usr/share/$pkgname/config/setting
  chmod g+w $pkgdir/usr/share/$pkgname/config/setting
  chgrp -R games $pkgdir/usr/share/$pkgname/replay
  chmod g+w $pkgdir/usr/share/$pkgname/replay
  cp nullpomino $pkgdir/usr/bin
}

# vim:set ts=2 sw=2 et:
