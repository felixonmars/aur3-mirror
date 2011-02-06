# $Id: PKGBUILD 82 2009-07-17 19:56:55Z aaron $

pkgname=glitz-git
pkgver=20090803
pkgrel=1
pkgdesc="OpenGL image compositing library"
arch=(i686 x86_64)
url="http://cairographics.org/"
provides=('glitz')
conflicts=('glitz')
license=('BSD')
depends=('libgl')
makedepends=('mesa' 'gtk-doc')
options=('!libtool')
source=()
md5sums=()

_gitroot="git://git.tuxfamily.org/gitroot/ccm/glitz.git"
_gitname="glitz"

build() {
  cd ${srcdir}
  msg "Connecting to GIT server...."

  if [ -d ${srcdir}/$_gitname ] ; then
  cd $_gitname && git pull origin
  msg "The local files are updated."
  else
  git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  git clone $_gitname $_gitname-build
  cd ${srcdir}/$_gitname-build

  ./autogen.sh --prefix=/usr
  make || return 1
  make DESTDIR=${startdir}/pkg install
  install -D -m644 COPYING ${startdir}/pkg/usr/share/licenses/${pkgname}/COPYING
}
