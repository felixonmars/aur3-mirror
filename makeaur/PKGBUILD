# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=makeaur
pkgver=20100718
pkgrel=1
pkgdesc="A simple AUR wrapper."
arch=('any')
url="http://ghost1227.com/makeaur"
license=('GPL')
makedepends=('git')

_gitroot="git://github.com/ghost1227/makeaur.git"
_gitname="makeaur"

build() {
  cd ${srcdir}
  msg "Connecting to GIT server...."

  if [ -d ${_gitname} ] ; then
    cd ${_gitname} && git pull origin
    msg "The local files are updated."
  else
    git clone ${_gitroot}
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf ${srcdir}/${_gitname}-build
  git clone ${srcdir}/${_gitname} ${srcdir}/${_gitname}-build
  cd ${srcdir}/${_gitname}-build

  install -Dm755 ${pkgname} ${pkgdir}/usr/bin/${pkgname}
  install -Dm644 man/${pkgname}.1 ${pkgdir}/usr/share/man/man1/${pkgname}.1
} 
