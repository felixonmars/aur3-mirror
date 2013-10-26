# Maintainer: laloch <laloch@atlas.cz>
# Contributor: Ivan Shapovalov <intelfx100@gmail.com>

pkgname=bekwinfx-git
epoch=1
pkgver=21.5c44e5f
pkgrel=1
pkgdesc="Several 3rd party plugins for the KDE KWin compositor (BE::Clock or beclock, BE::Animated, BE::Distorted)"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/bekwinfx/"
license=('GPL2')
depends=('kdebase-workspace')
makedepends=('cmake' 'automoc4' 'git' 'xcb-util-keysyms' 'xcb-util-wm')
provides=('bekwinfx' 'beclock')
conflicts=('bekwinfx' 'beclock')
options=('!emptydirs')

source=("bekwinfx::git://git.code.sf.net/p/bekwinfx/code")
md5sums=('SKIP')

pkgver() {
  cd bekwinfx

  printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd bekwinfx

  cmake . \
    -DCMAKE_INSTALL_PREFIX="$(kde4-config --prefix)" \
    -DQT_QMAKE_EXECUTABLE=/usr/bin/qmake-qt4 \
    -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd bekwinfx

  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
