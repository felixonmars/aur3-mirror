# Maintainer: Ryan Huffman <ryanhuffman(at)gmail(dot)com>

pkgname=xf86-input-tuio-git
pkgver=20091113
pkgrel=1
pkgdesc="X.org TUIO input driver"
arch=('i686' 'x86_64')
url="http://rhuffman.wordpress.com/"
license=('custom')
depends=('liblo' 'hal' 'dbus')
makedepends=('pkgconfig' 'git' 'xorg-util-macros' 'autoconf' 'automake')
conflicts=()
groups=('xorg-input-drivers')
options=(!libtool)
source=()
md5sums=()

_gitroot="git://repo.or.cz/xf86-input-tuio.git"
_gitname="xf86-input-tuio"

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

