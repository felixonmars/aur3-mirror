# Maintainer: Cristian Maureira <saint [at] archlinux.cl>

pkgname=kdestyle-darkpearl-qtcurve
pkgver=0.6
pkgrel=1
pkgdesc="A dark theme for KDE4 and QtCurve."
arch=('i686' 'x86_64')
license=('GPL')
url="http://www.kde-look.org/content/show.php/darkPearl+for+QtCurve?content=97644"
depends=('kdebase-workspace>=4' 'qtcurve-kde4')
source=(http://www.kde-look.org/CONTENT/content-files/97644-darkPearl-${pkgver}.tar.gz)
md5sums=('da43472347fe29e9f37015318171aa6a')

build() {
  cd ${srcdir}/darkPearl-${pkgver}
  install -D darkPearl.colors ${pkgdir}/usr/share/apps/color-schemes/darkPearl.colors
  install -D darkpearl.qtcurve ${pkgdir}/usr/share/apps/QtCurve/darkpearl.qtcurve
}
