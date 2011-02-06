# Contributor: Jon Nordby <jononor@gmail.com>
# Maintainer: Jon Nordby <jononor@gmail.com>

_pkgname=meegotouch-feedback
pkgname=$_pkgname-git
pkgver=20101220
pkgrel=1
pkgdesc="MeegoTouch Feedback"
arch=('x86_64' 'i686')
url="http://wiki.meego.com/MeeGo_Touch_Framework"
license=('LGPL')
makedepends=('git')
depends=('qt' 'contextkit')
provides=($_pkgname)
conflicts=($_pkgname)

_gitroot="git://gitorious.org/meegotouch/meegotouch-feedback.git"
_gitname="$_pkgname"

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

  # BUILD
  qmake
  make
  make install INSTALL_ROOT="$pkgdir/"
} 
