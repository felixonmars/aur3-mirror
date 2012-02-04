pkgname=compizconfig-backend-kconfig4-git
pkgver=20110827
pkgrel=1
pkgdesc="Compizconfig KDE 4 kconfig backend - Latest Git Version"
url="http://www.compiz.org/"
license=('GPL' 'LGPL' 'MIT')
arch=('i686' 'x86_64')
depends=('libcompizconfig-git' 'kdelibs' 'libxcomposite' 'libxinerama')
makedepends=('intltool' 'cmake')
provides=('compizconfig-backend-kconfig4')
conflicts=('compizconfig-backend-kconfig4')

_gitroot="git://git.compiz.org/compiz/compizconfig/compizconfig-backend-kconfig4/"
_gitname=compizconfig-backend-kconfig4

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "${_gitname}" ]]; then
    cd "${_gitname}" && git pull origin
    msg "The local files are updated."
  else
    git clone "${_gitroot}" "${_gitname}"
    cd "${_gitname}"
  fi

  [[ -d build ]] || mkdir build
  cd build
  cmake .. \
    -DCMAKE_BUILD_TYPE="Release" \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "${srcdir}"
  cd "${_gitname}"
  cd build
  make install
}

