# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# See http://wiki.archlinux.org/index.php/VCS_PKGBUILD_Guidelines
# for more information on packaging from GIT sources.

# Maintainer: Filippov Aleksey <sarum9in@gmail.com>
pkgname=zeromq3-git
pkgver=20111008
pkgrel=1
pkgdesc="Fast messaging system built on sockets. AKA 0MQ, ZMQ."
arch=('i686' 'x86_64')
url="http://www.zeromq.org/"
license=('LGPL')
groups=()
depends=('util-linux')
makedepends=('git' 'asciidoc' 'xmlto')
provides=('zeromq')
conflicts=()
replaces=()
backup=()
options=(!libtool)
install=
source=()
noextract=()
md5sums=()

_gitroot="git://github.com/zeromq/zeromq3-0.git"
_gitname="zeromq"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  #
  # BUILD HERE
  #
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

check() {
  cd "$srcdir/$_gitname-build"
  make -k check
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
