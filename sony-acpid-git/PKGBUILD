# Maintainer: gadget3000 <gadget3000 at msn dot com>
pkgname=sony-acpid-git
pkgver=20110812
pkgrel=1
pkgdesc="A daemon to automatically adjust the monitor brightness on Sony laptops"
arch=('i686' 'x86_64')
url="http://code.google.com/p/vaio-f11-linux/wiki/AutoDimmingBacklightDaemon"
license=('GPL')
depends=('linux-sony' 'acpid')
makedepends=('git')

_gitroot="http://git.zx2c4.com/sony-acpid"
_gitname="sony-acpid"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot #$_gitname
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
  cd "$srcdir/$_gitname-build/bin"
#  make DESTDIR="$pkgdir/" install
  install -D -m744 sony-acpid ${pkgdir}/etc/rc.d/sony-acpid
} 
