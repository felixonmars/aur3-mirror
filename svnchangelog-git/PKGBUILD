# Maintainer: Alexander Rødseth <rodseth@gmail.com>
pkgname=svnchangelog-git
pkgver=20120114
pkgrel=2
pkgdesc="Utility for generating a ChangeLog from svn log"
arch=('x86_64' 'i686')
url="https://github.com/xyproto/svnchangelog"
license=('GPL2')
depends=('svn')
makedepends=('go')
provides=('svnchangelog')
conflicts=('svnchangelog')
_gitroot="git://github.com/xyproto/svnchangelog.git"
_gitname="svnchangelog"

build() {
  cd "$srcdir"

  msg "Connecting to the $_gitname git repository..."
  if [ -d "$srcdir/$_gitname" ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"
  cd "$srcdir"
  rm -rf $_gitname-build
  git clone $_gitname $_gitname-build
  cd "$_gitname-build"

  make
}

package() {
  cd "$_gitname-build"

  install -Dm755 svnchangelog "$pkgdir/usr/bin/svnchangelog"
  install -Dm 644 COPYING \
    "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

# vim:set ts=2 sw=2 et:
