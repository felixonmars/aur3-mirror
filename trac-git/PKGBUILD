# Maintainer: Jonathan Liu <net147@gmail.com>
pkgname=trac-git
pkgver=20110923
pkgrel=1
pkgdesc="Git Plugin for Trac"
arch=('any')
url="http://trac-hacks.org/wiki/GitPlugin"
license=('BSD')
depends=('trac>=0.12')
makedepends=('git' 'python2-distribute')

_gitroot="git://github.com/hvr/trac-git-plugin.git"
_gitname=TracGit

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

  rm -rf "${srcdir}/$_gitname-build"
  git clone "${srcdir}/${_gitname}" "${srcdir}/${_gitname}-build"
  cd "${srcdir}/${_gitname}-build"

  python2 setup.py build
}

package() {
  cd "${srcdir}/${_gitname}-build"
  python2 setup.py install --root="${pkgdir}" -O1
  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}

# vim:set ts=2 sw=2 et:
