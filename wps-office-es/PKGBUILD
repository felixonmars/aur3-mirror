# Maintainer: Aitor1995 <aitor1995@openmailbox.org>
pkgname=wps-office-es
pkgver=9.1.0.4751_a15
pkgrel=1
pkgdesc="Idioma en español para WPS office"
arch=('i686' 'x86_64')
url="http://wps-community.org/"
license=('custom')
makedepends=('qt4' 'git')
source=(git://github.com/wps-community/wps_i18n.git)
md5sums=('SKIP')

package() {
  cd "$srcdir/wps_i18n/es"
  make
  make install
}
