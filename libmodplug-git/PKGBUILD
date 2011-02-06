# Contributor: Devin J. Pohly <djpohly+arch@djpohly.com>
# Maintainer: Devin J. Pohly <djpohly+arch@djpohly.com>
pkgname=libmodplug-git
pkgver=20100502
pkgrel=1
pkgdesc="A MOD playing library"
arch=(i686 x86_64)
url="http://modplug-xmms.sourceforge.net/"
license=('custom')
depends=('gcc-libs')
makedepends=('git')
provides=('libmodplug')
conflicts=('libmodplug')
options=('!libtool')

_gitroot="git://modplug-xmms.git.sourceforge.net/gitroot/modplug-xmms/modplug-xmms"
_gitname="libmodplug"

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
  cd "$srcdir/$_gitname-build/$_gitname"

  #
  # BUILD HERE
  #
  autoreconf -i
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir/" install

  install -D COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
} 
