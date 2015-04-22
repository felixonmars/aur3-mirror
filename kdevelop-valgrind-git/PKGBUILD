# Maintainer: prettyvanilla <prettyvanilla@lavabit.com>

_pkgname=kdev-valgrind
pkgname=kdevelop-valgrind-git
pkgver=782.e3a5b5f
pkgrel=1
pkgdesc="A plugin offering full integration of the valgrind suite to KDevelop4"
arch=('i686' 'x86_64')
url="https://projects.kde.org/projects/playground/devtools/plugins/kdev-valgrind"
license=('GPL')
groups=('kdevelop-plugins')
depends=('kdevplatform-git' 'valgrind')
optdepends=('kdevelop-git' 'kdesdk-kcachegrind' 'massif-visualizer')
makedepends=('git' 'cmake' 'extra-cmake-modules' 'kdoctools')
provides=('kdevelop-valgrind')
conflicts=('kdevelop-valgrind')
source=("git://anongit.kde.org/kdev-valgrind")
md5sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
  cd "${_pkgname}"

  cmake -DCMAKE_BUILD_TYPE=RelWithDebInfo \
        -DCMAKE_SKIP_RPATH=ON \
        -DCMAKE_{SHARED,MODULE,EXE}_LINKER_FLAGS='-Wl,-O1,--sort-common,--as-needed,-z,relro' \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DKDE_INSTALL_USE_QT_SYS_PATHS=ON

  make
}

package() {
  cd "${_pkgname}"
  make DESTDIR="${pkgdir}" install
}
