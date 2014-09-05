# Maintainer: Iven Hsu <ivenvd@gmail.com>
# Contributor: Alois Nespor <alois.nespor@gmail.com>
#              Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=('kstardict-git' 'kdeplasma-applets-kstardict-git')
_pkgname=kstardict
pkgver=v1.0.2.r0.g9d17255
pkgrel=1
depends=('qt4')
makedepends=('git' 'cmake' 'automoc4' 'kdelibs')
arch=('i686' 'x86_64')
url="https://github.com/iven/kstardict"
license=('GPL2')
source=(git://github.com/iven/kstardict.git)
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/$_pkgname"

  qmake-qt4 ENABLED_PLUGINS="stardict web swac"
  make


  cd "${srcdir}/$_pkgname/kdeplasma"
  mkdir build
  cd build
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package_kstardict-git() {
pkgdesc="KDE clone of QStarDict with full support of StarDict dictionaries"
provides=('stardict' 'kstardict')
  cd "${srcdir}/$_pkgname"

  make INSTALL_ROOT="${pkgdir}" install
}

package_kdeplasma-applets-kstardict-git(){
pkgdesc="KDE clone of QStarDict with full support of StarDict dictionaries"
depends=('kdelibs' 'qt4' 'kstardict')
  cd "${srcdir}/$_pkgname/kdeplasma/build"

   make DESTDIR=${pkgdir} install
}

