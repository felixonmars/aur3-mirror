# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=todo
pkgver=20100202
pkgrel=1
pkgdesc="A simple cli todo application."
arch=('any')
url="http://github.com/ghost1227/todo"
license=('GPL')
makedepends=('git')

_gitroot="git://github.com/ghost1227/todo.git"
_gitname="todo"

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
