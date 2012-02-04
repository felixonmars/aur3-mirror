# Contributor: Henri Häkkinen  <henux@users.sourceforge.net>
pkgname=elfdump-git
pkgver=20090121
pkgrel=1
pkgdesc="ELF section dumper."
arch=('i686' 'x86_64')
url="http://github.com/henux/elfdump"
license=('GPL')
depends=('glibc')
makedepends=('git')
source=()
md5sums=()

_gitroot="git://github.com/henux/elfdump.git"
_gitname="elfdump"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git-pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  cp -r "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  ./autogen.sh
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir/" install
} 
