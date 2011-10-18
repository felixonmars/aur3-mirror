# Contributor: tocer <tocer.deng@gmail.com>
pkgname=vidma-git
pkgver=20111018
pkgrel=1
pkgdesc="Utility for manipulating virtual disk images"
arch=('i686' 'x86_64')
url="http://github.com/przemoc/vidma"
license=('GPL2')
#depends=()
makedepends=('git')
#source=($pkgname-$pkgver.tar.gz)
_gitroot="git://github.com/przemoc/vidma.git"
_gitname="vidma"
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

  #
  # BUILD HERE
  #

  ./configure --prefix=/usr || return 1
  make || return 1
  make install DESTDIR=$pkgdir
} 
