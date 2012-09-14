pkgname=ttf-zhunyuan
pkgver=1.0
pkgrel=1
depends=('fontconfig' 'xorg-font-utils')
pkgdesc="a chinese font"
arch=('any')
license=('GPL3')
url="http://www.dropbox.com"
source=(https://www.dropbox.com/s/vcbg95jtnau9he5/zhunyuan.ttf)
install=$pkgname.install
md5sums=('e9c18241895e87e5f027af0cb03a5bdf')

build()
{
    mkdir -p $pkgdir/usr/share/fonts/TTF
    cp $srcdir/$pkgname/*.ttf $pkgdir/usr/share/fonts/TTF
}
