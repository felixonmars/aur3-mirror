# Maintainer: Serge Ziryukin <masse.nicolas@gmail.com>

pkgname=sawman-git
pkgver=20110113
pkgrel=1
pkgdesc="Shared application and Window Manager module for DirectFB"
arch=('i686' 'x86_64')
url="http://www.directfb.org"
license=('LGPL')
depends=('kernel26' 'directfb-multi')

_gitroot="git://git.directfb.org/git/directfb/extras/SaWMan.git"
_gitname="SaWMan"

build () {
  cd "$srcdir"

  msg "Connecting to GIT server..."

  if [ -d "$srcdir/$_gitname" ]; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  cp -rf "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  ./autogen.sh --prefix=/usr || return 1
  make || return 1
}

package () {
  cd "$srcdir/$_gitname-build"

  make install DESTDIR="${pkgdir}" || return 1
}
