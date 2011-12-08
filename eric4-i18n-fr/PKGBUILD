# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: ganymede

pkgname=eric4-i18n-fr
pkgver=4.4.19
pkgrel=1
pkgdesc="French translation for the Eric4 IDE"
arch=('any')
url="http://eric-ide.python-projects.org/index.html"
license=('GPL')
depends=('eric4')
source=(http://downloads.sourceforge.net/eric-ide/$pkgname-$pkgver.tar.gz)
md5sums=('836d523abffadb65f9e88bdb7de4678c')

package() {
  cd ${srcdir}

  install -d ${pkgdir}/usr/lib/python2.7/site-packages/eric4/i18n
  install -m644 ${srcdir}/eric4-$pkgver/eric/i18n/* \
    ${pkgdir}/usr/lib/python2.7/site-packages/eric4/i18n
}
