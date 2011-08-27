# Contributor: Jesse Jaara <jesse.jaara@gmail.com>

pkgname=swfdec-git
pkgver=20100123
pkgrel=1
pkgdesc="Free library for decoding and rendering Flash animations"
arch=(i686 x86_64)
url="http://swfdec.freedesktop.org"
license=('LGPL')
depends=('gstreamer0.10-base' 'ffmpeg' 'gtk2' 'alsa-lib' 'liboil' 'libmad' 'libsoup' 'cairo-snapshot' 'ming')
makedepends=('git')
provides=('swfdec')
conflicts=('swfdec' 'swfdec-git-pulse')

_gitroot="git://anongit.freedesktop.org/git/swfdec/swfdec"
_gitname="swfdec"

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
  ./configure --prefix=/usr --with-audio=alsa
  make || return 1
  make DESTDIR="$pkgdir/" install
} 
