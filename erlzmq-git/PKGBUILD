# See http://wiki.archlinux.org/index.php/VCS_PKGBUILD_Guidelines
# for more information on packaging from GIT sources.

# Maintainer: Garrett Smith <g@rre.tt>
pkgname=erlzmq-git
pkgver=20110222
pkgrel=1
pkgdesc="Erlang bindings for 0MQ (ZeroMQ)"
arch=('i686' 'x86_64')
url="http://www.zeromq.org/bindings:erlang"
license=('BSD')
groups=()
depends=('erlang' 'zeromq-git')
makedepends=('git')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=()
noextract=()
md5sums=() #generate with 'makepkg -g'

_gitroot="git://github.com/zeromq/erlzmq.git"
_gitname="erlzmq"
_otpapp="zmq"
_otpappver="0.1"

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

  ./bootstrap
  ./configure --prefix="$pkgdir/"
  make && make docs
}

package() {
  cd "$srcdir/$_gitname-build"
  make install
  mkdir -p "$pkgdir/usr/lib/erlang/lib/"
  mv "$pkgdir/$_otpapp-$_otpappver" "$pkgdir/usr/lib/erlang/lib/"
}
