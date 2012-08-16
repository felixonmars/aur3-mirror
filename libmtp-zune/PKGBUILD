# $Id: PKGBUILD 145614 2011-12-24 03:54:58Z dreisner $
# Contributor: damir <damir@archlinux.org>
# Contributor: Kevin Edmonds <edmondskevin@hotmail.com>

pkgname=libmtp-zune
pkgver=20120806
pkgrel=1
pkgdesc="library implementation of the Media Transfer Protocol with Zune support"
arch=("i686" "x86_64")
url="https://github.com/kbhomes/libmtp-zune"
license=('LGPL')
depends=('libusb' 'libgcrypt')
options=('!libtool')
makedepends=('git')
provides=('libmtp')
replaces=('libmtp')

_gitroot="https://github.com/kbhomes/libmtp-zune.git"
_gitname="libmtp-zune"

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


  ./autogen.sh
  ./configure --prefix=/usr --with-udev=/usr/lib/udev
  make
}

package() {
	cd "$srcdir/$_gitname-build/"
    make DESTDIR="$pkgdir" install
}
