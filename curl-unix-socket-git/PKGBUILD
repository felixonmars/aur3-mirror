# Maintainer: Romain Schmitz <slopjong _.at._ slopjong _.dot._ de>

pkgname=curl-unix-socket-git
_pkgname=${pkgname/-git}
pkgver=20140829
pkgrel=1
pkgdesc="Run HTTP requests over UNIX socket"
url="https://github.com/Soulou/curl-unix-socket"
arch=('any')
license=('MIT')
depends=()
makedepends=('git' 'go')
source=()
md5sums=()

_gitroot="https://github.com/Soulou/${_pkgname}"


build() {

  cd "$srcdir"
  msg "Connecting to github.com..."

  if [ -d ${srcdir}/${_pkgname} ] ; then
    cd ${_pkgname} && git pull origin master
    msg "The local files are updated."
  else
    git clone ${_gitroot}
    cd ${_pkgname}
  fi

  msg "GIT checkout done or server timeout"
  msg "Now build ..."  

  go build
}

package() {
  mkdir -p "$pkgdir"/usr/bin
  mv "$srcdir"/$_pkgname/$_pkgname "$pkgdir"/usr/bin
}

# vim:set ts=2 sw=2 et:
