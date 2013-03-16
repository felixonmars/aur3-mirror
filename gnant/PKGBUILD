# Maintainer: Juri Grabowski <gratuxri@gmail.com>
pkgname=gnant
pkgver=0.2
pkgrel=0
pkgdesc="awesome icon theme"
arch=('x86_64' 'i386')
url="http://aniki.free.fr/puits/desktop_custom"
license=('GPLv3')
depends=()
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
install=
source=("http://aniki.free.fr/puits/desktop_custom/${pkgname}-${pkgver}.tar.bz2")
md5sums=('5f7d9871b7066f3fa18274d665e27ed7')

build() {
  cd "${srcdir}"
  tar xvfj ${pkgname}-${pkgver}.tar.bz2
}

package() {
  cd "${srcdir}"
mkdir -p ${pkgdir}/usr/share/icons
cp -r ${pkgname} ${pkgdir}/usr/share/icons/
}
