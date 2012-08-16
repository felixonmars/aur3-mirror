# Maintainer: lilydjwg lilydjwg AT gmail.com

pkgname=labrea-lua-git
pkgver=20120816
pkgrel=1
pkgdesc="Scripting other people's programs."
arch=("i686" "x86_64")
license=(unknown)
url="https://github.com/dustin/labrea"
depends=('lua')
makedepends=('git' 'python2')
conflicts=('labrea-lua')
replaces=('labrea-lua')
provides=("labrea-lua")

_gitname="labrea-lua"
_gitroot="git://github.com/dustin/labrea.git"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."
  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone --depth=1 $_gitroot $_gitname
  fi
  msg "GIT checkout done or server timeout"
  
  rm -rf "$srcdir/$_gitname-build"
  cp -rf "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  ./configure
  sed -i 's=^\t\./\(\w\+\.py\)$=\tpython2 \1=' Makefile
  sed -i -e 's=libexec=lib/labrea=' \
    -e 's=share/labrea-init=share/labrea/labrea-init=' \
    labrea Makefile
  make PREFIX=/usr
}
package(){
  cd $srcdir/$_gitname-build
  make PREFIX=/usr DESTDIR=$pkgdir install
}
