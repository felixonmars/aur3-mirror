# sony_sketch_ef_font
# Maintainer: ying <Jinoto Systems>
# Contributor: ying <Jinoto Systems>

pkgname=sony_sketch_ef_font
pkgver=1.0
pkgrel=1
url="http://www.dafont.com/sony-sketch-ef.font"
license=('GPL')
depends=('fontconfig' 'xorg-font-utils')
pkgdesc="custom fonts"
arch=('any')
source=(Sony_Sketch_EF.ttf)
install=$pkgname.install

build()
{
  mkdir -p $pkgdir/usr/share/fonts/TTF
  cp $srcdir/*.ttf $pkgdir/usr/share/fonts/TTF
}

md5sums=('b025735ccc43ef098b0a02312a5f2e2f')
