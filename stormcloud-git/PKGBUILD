# Based on PKGBUILD from lightread-git by Raphael Scholer

# Maintainer: Jamon Evans <jamon.evans@gmx.com>
pkgname=stormcloud-git
pkgver=20121022
pkgrel=1
pkgdesc="An awesome weather app"
arch=('any')
url="https://github.com/consindo/stormcloud"
license=('custom')
depends=('pygtk' 'python2' 'python2-gobject')
makedepends=('git' 'python2-distutils-extra')
install=stormcloud-git.install

_gitroot="git://github.com/consindo/stormcloud.git"
_gitname="stormcloud.git"

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

  cd "${srcdir}/${_gitname}-build/"
}

package() {
  cd "$srcdir/${_gitname}-build"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
