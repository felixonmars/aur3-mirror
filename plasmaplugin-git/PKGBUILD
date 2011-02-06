# Contributor: BeholdMyGlory <larvid@gmail.com>

pkgname=plasmaplugin-git
pkgver=20090202
pkgrel=1
pkgdesc="Plugin for Firefox for displaying KDE4 plasmoids in a web page."
arch=('i686' 'x86_64')
url="http://repo.or.cz/w/plasmaplugin.git"
license=('GPL')
depends=('kdelibs')
makedepends=('cmake' 'automoc4' 'qt>=4.4.3' 'git')
install=${pkgname}.install

_gitroot="git://repo.or.cz/plasmaplugin.git"
_gitname="plasmaplugin"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  cp -r "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cp ../CMakeLists.txt "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"



  cmake .
  make || return 1
  make DESTDIR="$pkgdir/" install
  cp "$srcdir/$_gitname-build/examples/plasma.html" "$pkgdir"/usr/lib/mozilla/plugins/
} 
