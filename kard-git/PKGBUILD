# Contributor: vicky91 <vickypaiers@gmail.com>
# Maintainer: vicky91 <vickypaiers@gmail.com>
pkgname=kard-git
pkgver=20120201
pkgrel=1
pkgdesc="A Memory-like game for kids."
arch=('i686' 'x86_64')
url="https://projects.kde.org/projects/playground/edu/kard"
license=('GPL')
depends=('kdebase-runtime')
makedepends=('git' 'automoc4' 'cmake')
conflicts=()
#install=${pkgname}.install

_gitroot='git://anongit.kde.org/kard'
_gitname='kard'

build() {
  cd "${srcdir}"
  msg "Connecting to GIT server...."

  if [[ -d "${_gitname}" ]]; then
    cd "${_gitname}" && git pull origin
    msg "The local files are updated."
  else
    git clone "${_gitroot}" "${_gitname}"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "${srcdir}/${_gitname}-build"
  git clone "${srcdir}/${_gitname}" "${srcdir}/${_gitname}-build"
  cd "${srcdir}/${_gitname}-build"

  cmake . -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "${srcdir}/${_gitname}-build"
  make DESTDIR="${pkgdir}/" install
}

 
