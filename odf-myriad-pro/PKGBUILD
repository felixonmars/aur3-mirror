#Maintainer: Benny Darshan  <bennydarshan at gmail dot com>

pkgname=odf-myriad-pro
pkgver=1.0
pkgrel=1
pkgdesc="Myriad Pro fonts"
arch=(any)
url="http://http://www.cufonfonts.com/en/font/492/myriad-pro"
depends=(fontconfig xorg-font-utils)
source=("http://www.cufonfonts.com/download/font/492/myriad-pro")
md5sums=('a468bd4a19989a083c8700b903a2fc34')
install=$pkgname.install

package() {
  install -d "$pkgdir/usr/share/fonts/TTF"
  install -m644 "$srcdir/"*.OTF "$pkgdir/usr/share/fonts/TTF/"
}
