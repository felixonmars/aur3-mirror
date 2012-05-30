# Maintainer: Sid Karunaratne <sid at karunaratne dot net>
pkgname=php-zmq-git
pkgver=20120530
pkgrel=1
pkgdesc="PHP Driver for zeromq"
arch=("i686" "x86_64")
url="https://github.com/mkoppanen/php-zmq"
license=("GPL")
depends=("php" "zeromq")
makedepends=("git")
backup=("etc/php/conf.d/zmq.ini")
source=("zmq.ini")
md5sums=("f8e775a09c36c913c06e5866f1a825ec")

_gitroot="git://github.com/mkoppanen/php-zmq.git"
_gitname="php-zmq"

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

  cd "$srcdir/$_gitname"
  phpize
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_gitname"
  make INSTALL_ROOT=$pkgdir install
  install -Dm644 $srcdir/zmq.ini "$pkgdir/etc/php/conf.d/zmq.ini"
}
