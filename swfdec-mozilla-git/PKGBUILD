# Contributor: Jesse Jaara <jesse.jaara@gmail.com>

pkgname=swfdec-mozilla-git
pkgver=20090712
pkgrel=1
pkgdesc="Free library for decoding and rendering Flash animations"
arch=(i686 x86_64)
url="http://swfdec.freedesktop.org"
license=('LGPL')
depends=('swfdec-git')
makedepends=('git')
provides=('swfdec-mozilla')
conflicts=('swfdec-mozilla' 'swfdec-mozilla-devel' 'flashplugin')
md5sums=()

_gitroot="git://anongit.freedesktop.org/git/swfdec/swfdec-mozilla"
_gitname="swfdec-mozilla"

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

  ./autogen.sh
  ./configure --prefix=/usr --with-plugin-dir=/usr/lib/mozilla/plugins/
  make || return 1
  make DESTDIR="$pkgdir/" install
} 
