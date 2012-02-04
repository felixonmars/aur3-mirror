pkgname=compizconfig-backend-gsettings-git
pkgver=20110827
pkgrel=2
pkgdesc="GSettings backend for compizconfig - Latest Git Version"
url="http://www.compiz.org/"
license=('GPL' 'LGPL' 'MIT')
arch=('i686' 'x86_64')
depends=('libcompizconfig-git')
makedepends=('intltool' 'cmake')
provides=('compizconfig-backend-gsettings')
conflicts=('compizconfig-backend-gsettings')

_gitroot="git://git.compiz.org/compiz/compizconfig/compizconfig-backend-gsettings/"
_gitname=compizconfig-backend-gsettings

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
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCOMPIZ_DESTDIR="${pkgdir}"
  make
}

package() {
  cd "${srcdir}"
  cd "${_gitname}"
  cd build
  make install

  rm -f "${pkgdir}/usr/share/glib-2.0/schemas/gschemas.compiled"
}

