# Contributor: Cyker Way <cykerway at gmail dot com>

pkgname=ncmpcr-git
pkgver=20110626
pkgrel=1
pkgdesc="ncmpcr - Ncurses MPD Client with Rating" 
arch=('i686' 'x86_64')
url="http://ncmpcr.cykerway.com"
license=('GPL3')
depends=('ncurses' 'libmpdclient-git')
makedepends=('git' 'autoconf' 'automake')
source=()
md5sums=()

_gitroot="git://github.com/cykerway/ncmpcr.git"
_gitname="ncmpcr"

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
  cd "$srcdir/$_gitname-build"

    ./autogen.sh \
        --prefix=$startdir/pkg/usr \

    make || return 1
    make prefix=$startdir/pkg/usr install
} 
