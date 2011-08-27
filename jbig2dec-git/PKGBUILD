# Maintainer: Evgeny Burmentyev <vir.found@gmail.com>
pkgname=jbig2dec-git
pkgver=20101203
pkgrel=1
pkgdesc="A decoder implementation of the JBIG2 image compression format."
arch=('x86_64' 'i686')
url="http://jbig2dec.sourceforge.net/"
license=('GPL3')
depends=('glibc')
makedepends=('git')
provides=('jbig2dec')
conflicts=('jbig2dec')

_gitroot="git://git.ghostscript.com/jbig2dec.git"
_gitname="jbig2dec"

build() {
  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
  else
    git clone $_gitroot
  fi

  rm -rf "$srcdir/$_gitname-build"
  cp -r "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  ./autogen.sh --prefix=/usr
  make
  make DESTDIR="$pkgdir/" install
}
