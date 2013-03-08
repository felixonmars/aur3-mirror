# Maintainer: Daniele Cocca <jmc@chakra-project.org>

_pkgname=cinstall
pkgname=cinstall-git
pkgver=20130308
pkgrel=1
pkgdesc="Chakra's Bundle Manager."
arch=('i686' 'x86_64')
url="http://chakra-project.org/"
license=('GPL')
depends=('rsync' 'cbundle' 'qt4' 'kdelibs')
makedepends=('automoc4' 'libcroco')
provides=('cinstall')
conflicts=('cinstall')
replaces=('cinstall')
install="cinstall.install"

_gitroot="git://gitorious.org/chakra/${_pkgname}.git"
_gitname="${_pkgname}"

build() {
  cd "${srcdir}"
  msg "Connecting to GIT server...."

  if [ -d "${_gitname}" ] ; then
    cd "${_gitname}" && git pull origin
    msg "The local files are updated."
  else
    git clone "${_gitroot}" "${_gitname}"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "${srcdir}/${_gitname}-build"
  git clone "${srcdir}/${_gitname}" "${srcdir}/${_gitname}-build"
  cd "${srcdir}/${_gitname}-build"

  cmake -DCMAKE_INSTALL_PREFIX="$(kde4-config --prefix)" -DCMAKE_BUILD_TYPE=RelWithDebInfo
  make
}

package() {
  cd "${srcdir}/${_gitname}-build"
  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
