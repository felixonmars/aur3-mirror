# Maintainer: Andreas Krinke <andreas dot krinke at gmx dot de>
pkgname=chipmunk-git
pkgver=20120211
pkgrel=1
pkgdesc="A high-performance 2D rigid body physics library"
arch=('i686' 'x86_64')
url="http://chipmunk-physics.net"
license=('MIT')
depends=('glibc')
makedepends=('cmake' 'git')
conflicts=('chipmunk')
provides=('chipmunk')

source=()
md5sums=()

_gitroot="git://github.com/slembcke/Chipmunk-Physics.git"
_gitname="chipmunk"

build() {
  cd "${srcdir}"
  msg "Connecting to GIT server...."

  if [[ -d "${srcdir}/${_gitname}" ]]; then
    cd "${_gitname}" && git pull origin
    msg "The local files are updated."
  else
    git clone "${_gitroot}" --depth=1 "${_gitname}"
  fi

  msg "GIT checkout done or server timeout"
  
  msg "Creating build directory"
  rm -rf "${srcdir}/${_gitname}-build"
  cp -R "${srcdir}/${_gitname}" "${srcdir}/${_gitname}-build"

  msg "Starting build..."
  cd "${srcdir}/${_gitname}-build"
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DBUILD_DEMOS=OFF .
  make
}

package() {
  cd "${srcdir}/${_gitname}-build"
  make DESTDIR="${pkgdir}" install
  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 "${srcdir}/${_gitname}-build/LICENSE.txt" \
                 "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
