#Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=kdeplasma-applets-smooth-tasks-fork-hg
pkgver=532
pkgrel=1
pkgdesc="Is a fork of Smooth Task. Smooth Tasks is a fork of the STasks plasma applet (Mercurial)"
arch=('i686' 'x86_64')
url="https://bitbucket.org/flupp/smooth-tasks-fork"
license=('GPL')
depends=('kdebase-workspace')
makedepends=('mercurial' 'cmake' 'kdelibs' 'automoc4')
provides=('kdeplasma-applets-smooth-tasks')
replaces=('kdeplasma-applets-smooth-tasks')
conflicts=('smooth-tasks-fork' 'smooth-tasks' 'smooth-tasks2' 'kdeplasma-applets-smooth-tasks2')
source=('smooth-tasks-fork::hg+https://bitbucket.org/flupp/smooth-tasks-fork#branch=kde-4.8')
md5sums=('SKIP')
_hgname="smooth-tasks-fork"

pkgver() {
  cd "${srcdir}/${_hgname}"
  hg identify -n
}

build() {
  cd "${srcdir}/${_hgname}"

  cmake . -DCMAKE_INSTALL_PREFIX="$(kde4-config --prefix)"
  make
}

package() {
  cd "${srcdir}/${_hgname}"
  make DESTDIR="${pkgdir}" install
}