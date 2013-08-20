# Maintainer: Alessio Sergi <asergi at archlinux dot us>

pkgname=oxygen-transparent-git
_pkgname=oxygen-transparent
pkgver=246.f2f067d
pkgrel=1
pkgdesc="Oxygen style and decoration with support for transparency"
arch=('i686' 'x86_64')
url="https://projects.kde.org/projects/playground/artwork/oxygen-transparent"
license=('GPL' 'LGPL')
depends=('kdebase-workspace')
makedepends=('cmake' 'git' 'automoc4')
provides=(${_pkgname})
conflicts=(${_pkgname})
source=("git+git://anongit.kde.org/oxygen-transparent")
md5sums=('SKIP')

pkgver() {
cd "${_pkgname}"
echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "${srcdir}/${_pkgname}"
  cmake -DCMAKE_BUILD_TYPE=RELEASE \
        -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix`
  make
}

package() {
  cd "${srcdir}/${_pkgname}"
  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
