pkgname=ttf-josefernandez
pkgver=1.0
pkgrel=1
depends=('fontconfig' 'xorg-font-utils')
pkgdesc="Font 'JoseFernandez' provided by fontineed.com"
arch=('any')
url="http://www.fontineed.com/font/Jose_Fernandez"
license=('cc-by-nc-sa-3.0')
source=(http://www.fontineed.com/downloads/Jose_Fernandez.zip)
install=$pkgname.install
md5sums=('9cfd2d89f9ea507902f5bf12ee0b86d7')

build()
{
  mkdir -p $pkgdir/usr/share/fonts/TTF
  cp $srcdir/*.ttf $pkgdir/usr/share/fonts/TTF
}

