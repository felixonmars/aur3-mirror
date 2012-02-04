# Contributor: totoloco <totoloco at gmx dot com>
_realname=retumilo
pkgname=${_realname}-git
pkgver=20100218
pkgrel=1
pkgdesc="Qt webkit vi style browser. ¡El Ratón Emilio!"
arch=('i686' 'x86_64')
url="http://${_realname}.co.cc/"
license=('GPL')
depends=('qt')
optdepends=('tabbed: tab support')
makedepends=('git' 'qt')

_gitroot="git://gitorious.org/${_realname}/${_realname}.git"
_gitname=${_realname}

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  qmake || return 1
  make || return 1
  make INSTALL_ROOT="$pkgdir/" install
} 
