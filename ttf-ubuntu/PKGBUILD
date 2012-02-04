pkgname=ttf-ubuntu
pkgver=1.0
pkgrel=1
depends=('fontconfig' 'xorg-font-utils')
pkgdesc="Ubuntu 10.10 Fonts"
arch=('any')
source=('http://font.ubuntu.com/download/ubuntu-font-family-0.70.1.zip')
license=('custom')
url=('http://font.ubuntu.com/download/ubuntu-font-family-0.70.1.zip')
md5sums=('ec2e9b6535c74a654cc6bd2d935b5856')
install=$pkgname.install

build()
{
  mkdir -p $pkgdir/usr/share/fonts/TTF
  cp $srcdir/ubuntu-font-family-0.70.1/*.ttf $pkgdir/usr/share/fonts/TTF
}

