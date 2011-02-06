# Maintainer: alexanderte
# Contributor: Xyne
pkgname=flo-git
pkgver=20100815
pkgrel=1
pkgdesc="A command line app for organizing events, to-dos, and deadlines."
arch=('i686' 'x86_64')
url="http://github.com/alexanderte/flo"
license=('ISC')
makedepends=('git')
provides=('flo')
conflicts=('flo')

_gitroot="git://github.com/alexanderte/flo.git"
_gitname="flo"

build() {
  cd "$srcdir"

  if [ -d "$_gitname" ] ; then
    cd "$_gitname" && git pull origin
  else
    git clone "$_gitroot" "$_gitname"
    cd "$_gitname"
  fi

  make
  install -Dm755 flo "${pkgdir}/usr/bin/flo"
}
