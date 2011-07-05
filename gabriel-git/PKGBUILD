# Maintainer: Duong Pham <dthpham@gmail.com>

pkgname=gabriel-git
pkgver=20110704
pkgrel=1
pkgdesc="Provides remote D-Bus connections over SSH"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/gabriel/"
license=('GPL2')
depends=('libssh>=0.2' 'glib2>2.10', 'socat>1.5', 'dbus')
makedepends=('git')
provides=('gabriel')
conflicts=('gabriel')

_gitroot=git://gabriel.git.sourceforge.net/gitroot/gabriel/gabriel 
_gitname=gabriel
_gitbranch=master

build() {
  cd "$srcdir"

  msg "Connecting to $_gitroot..."
  if [[ -d $_gitname ]]; then
    cd $_gitname && git pull origin && cd ..
    msg2 "Local files updated"
  else
    git clone $_gitroot
    msg2 "Git checkout done"
  fi

  rm -rf $_gitname-build
  git clone $_gitname $_gitname-build
  cd $_gitname-build

  msg "Starting make..."
  ./autogen.sh
  ./configure --prefix=/usr --sysconfdir=/etc

  make || return 1
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir" install
}
