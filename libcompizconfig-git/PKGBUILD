pkgname=libcompizconfig-git
pkgver=20110827
pkgrel=1
pkgdesc="Compiz configuration system library - Latest Git Version"
arch=('i686' 'x86_64')
url="http://compiz.org"
license=('GPL')
provides=('libcompizconfig')
conflicts=('libcompizconfig')
depends=('compiz-core-git' 'libxml2' 'protobuf')
makedepends=('intltool' 'pkgconfig' 'cmake')

_gitroot="git://git.compiz.org/compiz/compizconfig/libcompizconfig/"
_gitname=libcompizconfig

build() {
  cd "${srcdir}"
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
  env PKG_CONFIG_PATH="/usr/lib/pkgconfig:$PKG_CONFIG_PATH" \
  cmake .. \
    -DCMAKE_BUILD_TYPE="Release" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCOMPIZ_DESTDIR="${pkgdir}"
  make
}

package() {
  cd "${srcdir}"
  cd "${_gitname}"
  cd "build"
  make install
  make findcompizconfig_install
  rm -f "${pkgdir}/usr/share/glib-2.0/schemas/gschemas.compiled"
}
