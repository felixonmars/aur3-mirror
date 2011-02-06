# Contributor: Ali Shuja Siddiqui <alishuja [at] gmail.com>
pkgname=networkled-git
pkgver=20100530
pkgrel=1
pkgdesc="Network interface traffic LEDs made with qt4"
arch=('any')
url="http://github.com/alishuja/networkled"
license=('GPL3')
depends=('qt>=4')
makedepends=('git')

_gitroot="git://github.com/alishuja/networkled.git"
_gitname="networkled"

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
  cp -r "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  #
  # BUILD HERE
  #

  qmake || return 1
  make || return 1
  make DESTDIR="$pkgdir/" INSTALL_ROOT="$pkgdir/usr" install || return 1
} 
