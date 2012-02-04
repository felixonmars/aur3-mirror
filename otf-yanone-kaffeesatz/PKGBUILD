pkgname=otf-yanone-kaffeesatz
pkgver=1.0
pkgrel=1
depends=('fontconfig' 'xorg-font-utils')
pkgdesc="The free OpenType Yanone Kaffeesatz font"
arch=('any')
url='http://www.yanone.de/typedesign/kaffeesatz/'
license=('Creative Commons')
install=${pkgname}.install
source=('http://www.schnellmussesgehenundbilligmussessein.de/fonts/YanoneKaffeesatz.zip')
md5sums=('8d2f11ef209d35cfe378497939d45c2d')

build()
{
    cd $srcdir/
    mkdir -p $pkgdir/usr/share/fonts/OTF
    cp *.otf $pkgdir/usr/share/fonts/OTF
}


