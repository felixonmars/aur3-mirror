# Creator: Fabian Homborg <FHomborg@gmail.com>
# Maintainer: André Vitor de Lima Matos <andre.vmatos@gmail.com>
pkgname=kdeplasma-runners-appmenu-git
pkgver=20140730.50.4f11c83
pkgrel=1
pkgdesc="A krunner plugin that searches the appmenu"
arch=('i686' 'x86_64')
url="http://quickgit.kde.org/?p=appmenu-runner.git"
license=('GPL')
depends=('libdbusmenu-qt' 'kdelibs' 'appmenu-qt')
makedepends=('git' 'cmake' 'automoc4')
provides=('krunner-appmenu')
conflicts=('krunner-appmenu')
replaces=('krunner-appmenu')
source=('git://anongit.kde.org/appmenu-runner.git')
md5sums=('SKIP')

_gitname=appmenu-runner

pkgver() {
  cd "${_gitname}"
  echo $(git log -n 1 --date=short | sed -nr 's|^Date:\s+([0-9]{4})-([0-9]{2})-([0-9]{2})$|\1\2\3|p').$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "$srcdir/$_gitname"
  mkdir build
  cd build
  cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix`
  make
}

package() {
  cd "$srcdir/$_gitname/build"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
