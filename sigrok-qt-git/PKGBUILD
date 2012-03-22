# Maintainer: Peter Marheine <peter@taricorp.net>
pkgname=sigrok-qt-git
pkgver=20120321
pkgrel=2
pkgdesc="Client software that supports various hardware logic analyzers, Qt client"
arch=(i686 x86_64)
url="http://sigrok.org/"
license=('GPL')
provides=(sigrok-qt)
depends=(libsigrok libsigrokdecode qt)
makedepends=(git)
optdepends=()
source=(fix-install-path.patch)
md5sums=('768328b3092a09906fd3fc567d2038a1')

_gitroot=(git://sigrok.git.sourceforge.net/gitroot/sigrok/sigrok)
_gitname=sigrok

build() {
  msg "Connecting to GIT server...."

  if [[ -d $_gitname ]]; then
    cd $_gitname && git pull origin
    cd ..
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  cd $_gitname
  patch -p1 -i "$srcdir/fix-install-path.patch"

  cd sigrok-qt
  qmake
  make
}

package() {
  cd "$srcdir/$_gitname/sigrok-qt"
  make INSTALL_ROOT="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
