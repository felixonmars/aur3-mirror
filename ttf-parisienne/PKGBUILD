# Maintainer: Verdi R-D <verdi@azend.org>
pkgname=ttf-parisienne
pkgver=1.0
pkgrel=1
depends=('fontconfig' 'xorg-font-utils')
pkgdesc="custom fonts"
arch=('any')
url="http://www.google.com/webfonts#QuickUsePlace:quickUse/Family:Parisienne"
license=('OFL')
source=($pkgname-$pkgver.tar.bz2)
md5sums=('e00a9432fab0f269872ad1ef5a3f4a4f')
install=$pkgname.install

build()
{
  mkdir -p $pkgdir/usr/share/fonts/TTF
  cp $srcdir/$pkgname/*.ttf $pkgdir/usr/share/fonts/TTF
}
