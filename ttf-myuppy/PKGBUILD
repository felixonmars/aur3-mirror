# Contributor:	crazyb0y	<gmail.com: bjin1990>
# Maintainer:	Jesse Jaara	<gmail.com: jesse.jaara>

pkgname=ttf-myuppy
pkgver=1.0
pkgrel=2
url=('http://No_upstream_website_exist_anymore.foobar')
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
pkgdesc="a Simplified Chinese font from Monotype Imaging Inc. and Symbian Foundation"
arch=('any')
license=('Custom: Eclipse Public Licence 1.0')
source=(http://huulivoide.pp.fi/Arch/sources/${pkgname}-${pkgver}.tar.xz)
install=${pkgname}.install

package()
{
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -d "${pkgdir}/usr/share/fonts/TTF/"
  install -m644 *.ttf "${pkgdir}/usr/share/fonts/TTF/"
  install -d "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -m644 README "${pkgdir}/usr/share/licenses/${pkgname}/"
}

md5sums=('2bf5c5c2d7d79bd6892ad0a004368b1a')
