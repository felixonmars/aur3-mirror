# Maintaner: Joel Teixeira <joelteixeira at gmail dot com>
pkgname=ttf-andalus
pkgver=1.0
pkgrel=4
depends=('fontconfig' 'xorg-font-utils')
pkgdesc="Andalus Font (TTF)"
arch=('any')
url=('http://www.fonts2u.com/andalus.font')
license=('GPL')
source=(http://ttf-andalus.googlecode.com/files/ttf-andalus.tar.bz2)
install=$pkgname.install
md5sums=('f102dc25633b07004b49937bae093747')

build()
{
  mkdir -p $pkgdir/usr/share/fonts/TTF
  cp $srcdir/*.ttf $pkgdir/usr/share/fonts/TTF
}
