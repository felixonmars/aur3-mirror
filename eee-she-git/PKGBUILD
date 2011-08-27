# Maintainer: Christopher Rosell <chrippa@gmail.com>
pkgname=eee-she-git
pkgver=20090829
pkgrel=1
pkgdesc="Simple interface for controlling Super Hybrid Engine on Asus Eee PC's"
arch=('i686' 'x86_64')
url="http://github.com/chrippa/eee-she"
license=('BSD')
makedepends=(git)

_gitname="eee-she"
_gitroot="git://github.com/chrippa/eee-she.git"

build() {
  cd ${srcdir}

  if [ -d $startdir/src/$_gitname ] ; then
    cd $_gitname && git pull origin
    msg "Local files are up-to-date."
  else
    git clone $_gitroot
  fi

  cd ${srcdir}/${_gitname}
  make || return 1
  make DESTDIR=${pkgdir} install || return 1
}
