# Maintainer: George Kamenov < cybertorture@gmail.com >
#
# This is not part of "terminology" (yet?) , it is for testing purpose only !
#

pkgname=terminology-guake-git
pkgver=1
pkgrel=2
pkgdesc="Terminal emulator for e17, successor of previous eterm with extention 'guake-like'"
arch=('i686' 'x86_64')
groups=('e17-extra-svn')
url="http://www.enlightenment.org/p.php?p=about/terminology"
license=('BSD')
depends=('ecore' 'enlightenment17')
makedepends=('git')
provides=('terminology')
conflicts=('terminology-svn' 'terminology')
options=('!libtool')
source=()
md5sums=()

_gitroot="git://github.com/bearnik/terminology-guake.git"

build() {
  msg "Connecting to GIT server..."
  if [[ -d $srcdir/$pkgname-$pkgver ]]; then
    cd $srcdir/$pkgname-$pkgver && git pull origin
  else
    git clone $_gitroot $srcdir/$pkgname-$pkgver
    cd $srcdir/$pkgname-$pkgver
  fi

  msg "GIT checkout done or server timeout"
        ./autogen.sh --prefix=/usr
	make
}

package() {
        cd $srcdir/$pkgname-$pkgver
	make DESTDIR=$pkgdir PREFIX=$pkgdir/usr install
}


