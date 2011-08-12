# Maintainer: gadget3000 <gadget3000 at msn dot com>
pkgname=vaio-control-center-git
pkgver=20110812
pkgrel=1
pkgdesc="A Qt GUI to adjust Vaio specific hardware controls"
arch=('i686' 'x86_64')
url="http://code.google.com/p/vaio-f11-linux/wiki/VaioControlCenter"
license=('None')
depends=('linux-sony' 'qt')
makedepends=('git')

_gitroot="http://git.zx2c4.com/vaio-control-center"
_gitname="vaio-control-center"

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

  #
  # BUILD HERE
  #

#  ./autogen.sh
#  ./configure --prefix=/usr
#  make
./compile
}

package() {
  cd "$srcdir/$_gitname-build"
#  make DESTDIR="$pkgdir/" install
  install -D -m755 vaio-control-center ${pkgdir}/usr/bin/vaio-control-center
} 
