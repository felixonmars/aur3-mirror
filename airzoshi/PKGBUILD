# Maintainer: libkenta <libkenta@gmail.com>

pkgname=airzoshi
pkgver=2.16.3
pkgrel=1
pkgdesc='Vertical text viewer for Japanese "Aozora Bunko" format texts'
arch=('i686' 'x86_64')
url="http://www.memememo.com/u/sato/f1892/"
license=('unknown')
depends=('adobe-air')
source=(http://www.satokazzz.com/airzoshi/air/AirZoshi.air $pkgname.sh)
noextract=(AirZoshi.air)
md5sums=('a5ddc2cffdc57d838c5c6440b7f4871b'
         '29b8f817d0b95021b29b542b118dc7b5')

package() {
  cd $srcdir/

  install -d $pkgdir/{usr/bin,opt/$pkgname}
  install AirZoshi.air $pkgdir/opt/$pkgname/airzoshi.air
  install -m755 airzoshi.sh $pkgdir/usr/bin/airzoshi
}

# vim:set ts=2 sw=2 et:
