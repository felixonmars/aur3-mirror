# Contributor: Pierre Chapuis <catwell at archlinux dot us>
# Maintainer: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=lualpm-git
pkgver=20100329
pkgrel=1
pkgdesc="Lua bindings for libalpm."
arch=('i686' 'x86_64')
url="http://clyde.archuser.com"
license=('custom')
makedepends=('git')
provides=('lualpm')
conflicts=('clyde' 'clyde-git' 'lualpm')

_gitroot="git://github.com/Kiwi/clyde.git"
_gitname="clyde"

build() {
  cd "$srcdir"
  if [ -d $_gitname ] ; then
    cd $_gitname
    git pull origin
  else
    git clone $_gitroot
  fi
  msg "GIT checkout done or server timeout"

  cd $srcdir
  rm -rf $_gitname-build
  git clone $_gitname $_gitname-build
  cd $_gitname-build

  make lualpm || return 1
  make DESTDIR=${pkgdir} install_lualpm || return 1
  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
} 

