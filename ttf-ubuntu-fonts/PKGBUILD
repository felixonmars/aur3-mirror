pkgname=ttf-ubuntu-fonts
pkgver=0.8
pkgrel=1
depends=('fontconfig' 'xorg-font-utils' 'unzip')
pkgdesc="Ubuntu Font Family"
arch=('any')
source=('http://font.ubuntu.com/download/ubuntu-font-family-0.80.zip')
license=('custom')
url=('http://font.ubuntu.com/download/ubuntu-font-family-0.80.zip')
md5sums=('a1fc70f5a5b1d096ab8310886cddaa1c')
install=$pkgname.install

build()
{
  mkdir -p $pkgdir/usr/share/fonts/TTF
  cp $srcdir/ubuntu-font-family-0.80/*.ttf $pkgdir/usr/share/fonts/TTF
}

