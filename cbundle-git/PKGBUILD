# Maintainer: Daniele Cocca <jmc@chakra-project.org>

_pkgname=cbundle
pkgname=cbundle-git
pkgver=20120218
pkgrel=1
pkgdesc="A shared library for using Chakra software bundles."
arch=('i686' 'x86_64')
url="http://chakra-project.org/"
license=('GPL')
depends=('squashfs-tools' 'unionfs-fuse' 'sh')
makedepends=('qt' 'automoc4' 'kdebase-workspace')
provides=('cbundle')
conflicts=('cbundle')
replaces=('cbundle')

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
