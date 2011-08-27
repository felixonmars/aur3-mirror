# Contributor: tocer <tocer.deng@gmail.com>
pkgname=jsonval-git
pkgver=1
pkgrel=1
pkgdesc="a better json validator"
arch=('i686' 'x86_64')
url="https://github.com/dangerousben/jsonval"
license=('GPL2')
groups=()
depends=('bison')
makedepends=('git')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
noextract=()
_gitroot="https://github.com/dangerousben/jsonval.git"
_gitname="jsonval"
md5sums=()

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
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  make || return 1
  install -D -m755 jsonval $pkgdir/usr/bin/jsonval
} 
