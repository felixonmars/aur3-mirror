# Contributor: Artem Sereda <overmind88@gmail.com>
pkgname=qrosspython-git
pkgver=20101006
pkgrel=1
pkgdesc="Qross bindings for python"
arch=('i686' 'x86_64')
url="http://github.com/0xd34df00d/Qross"
license=('GPL')
depends=('qt>=4.6.0' 'pyqt' 'qross')
makedepends=('git')
provides=('qrosspython')
conflicts=('qrosspython')
source=()
md5sums=()

_gitroot="http://github.com/0xd34df00d/Qross.git"
_gitname="Qross"

build() {
  msg "Connecting to GIT server..."
  if [[ -d $srcdir/$pkgname-$pkgver ]]; then
    cd $srcdir/$pkgname-$pkgver && git pull origin || return 1
  else
    git clone $_gitroot $srcdir/$pkgname-$pkgver || return 1
    cd $srcdir/$pkgname-$pkgver/
  fi

  msg "GIT checkout done or server timeout"

 cd $srcdir/$pkgname-$pkgver/src/bindings/python/qrosspython/

  #
  # BUILD HERE
  #

  cmake -DCMAKE_INSTALL_PREFIX=/usr
  make  || return 1
  make DESTDIR=$startdir/pkg install
}  