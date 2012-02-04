# Contributor:	Dany Martineau <dany.luc.martineau@gmail.com>
# Maintainer:	Pablo Lezaeta <prflr@hotmail.com>

pkgname=frugal-icon-theme
pkgver=3.10
pkgrel=1
pkgdesc="Icon theme for KDE4 from Frugalware."
arch=('any')
depends=
url="http://www.kde-look.org/content/show.php/Frugal+KDE+Icon+Theme?content=112028"
license=('LGPL')
source=(http://perso.numericable.fr/centuri0/FrugalThemeForKDE4_${pkgver}.tar.bz2)
md5sums=('86966e9dce7c10674d41471341c7a5a3')

build() {
  cd ${srcdir}
  install -d ${pkgdir}/usr/share/icons/frugal
  cp -fR FrugalThemeForKDE4_${pkgver}/* ${pkgdir}/usr/share/icons/frugal
}
