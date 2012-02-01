#Contributor: Roberto Tarullo <nomeutente94@hotmail.it>
# Maintainer: vicky91 <vickypaiers@gmail.com>
pkgname=pairs-git
pkgver=20120201
pkgrel=1
pkgdesc="A memory and pairs game for KDE"
arch=('i686' 'x86_64')
url="https://projects.kde.org/projects/playground/edu/pairs"
license=('GPL')
depends=('kdebase-runtime')
makedepends=('cmake' 'automoc4' 'git')
intall=pairs-git.install


_gitroot='git://anongit.kde.org/pairs'
_gitname='pairs'

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

# vim:set ts=2 sw=2 et:
