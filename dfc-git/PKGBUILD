# Maintainer: Rolinh <robinDOThahlingATgw-computingDOTnet>
pkgname=dfc-git
_pkgname=dfc
pkgver=20130819
pkgrel=1
pkgdesc="DEVEL - Display file system space usage using graph and colors"
arch=('x86_64' 'i686')
url="http://projects.gw-computing.net/projects/dfc"
license=('BSD')
depends=('glibc')
makedepends=('git' 'cmake' 'gettext')
provides=('dfc')
conflicts=('dfc')
install='dfc.install'

_gitroot="git://gw-computing.net/dfc.git"
_gitname="dfc"

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
  git clone "${srcdir}/${_gitname}" "${srcdir}/$_gitname-build"
  cd "${srcdir}/$_gitname-build"

  cmake ./ '-DPREFIX=/usr' '-DSYSCONFDIR=/etc' '-DCMAKE_BUILD_TYPE=RELEASE'
  make
}

package() {
  cd "${srcdir}/$_gitname-build"

  make DESTDIR="${pkgdir}" install

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/"${_pkgname}"/LICENSE"
}

# vim:set ts=2 sw=2 et:
