# neuropolitical_font
# Maintainer: ying <Jinoto Systems>
# Contributor: ying <Jinoto Systems>

pkgname=neuropolitical_font
pkgver=1.0
pkgrel=1
url="http://www.dafont.com/neuropolitical.font"
license=('GPL')
depends=('fontconfig' 'xorg-font-utils')
pkgdesc="custom fonts"
arch=('any')
source=(neuropolitical.ttf)
install=$pkgname.install

build()
{
  mkdir -p $pkgdir/usr/share/fonts/TTF
  cp $srcdir/*.ttf $pkgdir/usr/share/fonts/TTF
}

md5sums=('09fbc647a8add912297c3908b05cf356')
