# Maintainer: Ryan Huffman <ryanhuffman(at)gmail(dot)com>

pkgname=tmd-git
pkgver=20091113
pkgrel=1
pkgdesc="TUIO Monitor Daemon"
arch=('i686' 'x86_64')
url="http://rhuffman.wordpress.com/"
license=('custom')
depends=('xorg-server>=1.7.0' 'libxi>=1.2.1')
makedepends=('pkgconfig' 'git' 'xorg-util-macros' 'autoconf' 'automake')
conflicts=('xorg-server<1.7.0')
options=(!libtool)
source=()
md5sums=()

_gitroot="git://repo.or.cz/tmd.git"
_gitname="tmd"

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

  ./autogen.sh
  ./configure --prefix=/usr || return 1
  make || return 1
  make DESTDIR="${pkgdir}" install || return 1
  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING" || return 1
} 

