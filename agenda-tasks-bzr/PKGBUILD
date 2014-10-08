pkgname=agenda-tasks-bzr
_bzrname=agenda-tasks
pkgver=43
pkgrel=1
pkgdesc="A simple, slick, speedy, no-nonsense task manager."
arch=('i686' 'x86_64')
url="https://launchpad.net/agenda-tasks"
license=('GPL3')
depends=('vala' 'gtk3' 'granite')
makedepends=('bzr' 'cmake')
provides=(${_bzrname})
install=${pkgname}.install
source=("$_bzrname::bzr+http://bazaar.launchpad.net/~agenda-developers/$_bzrname/trunk")
sha256sums=('SKIP')

pkgver() {
  cd $_bzrname
  bzr revno
}

build() {
  cd "${srcdir}/$_bzrname"

  msg "Starting make..."

  cmake -DCMAKE_INSTALL_PREFIX=/usr
  sed -e '/glib-compile-schemas/ s/^#*/#/' -i schemas/cmake_install.cmake
  make
}

package() {
  cd "${srcdir}/$_bzrname"

  make DESTDIR="$pkgdir/" install
}


