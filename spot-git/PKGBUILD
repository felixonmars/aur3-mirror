# Maintainer: Diego Mascialino <diego@gcoop.coop    >

pkgname=spot-git
pkgver=20120326
pkgrel=1
pkgdesc="Tiny ack-style file search utility. A Bash-based grep replacement"
arch=('any')
url="https://github.com/guille/spot"
license=('MIT')
depends=()
makedepends=('curl')

_gitroot=git://github.com/guille/spot.git
_gitname=spot

build() {
  cd $srcdir

  if [ -d $startdir/src/$_gitname ] ; then
    cd $_gitname && git pull origin
  else
    git clone $_gitroot
  fi

  mkdir -p $pkgdir/usr/local/bin
  mkdir -p $pkgdir/usr/local/share/man/man1
  cd "$srcdir/$_gitname"
  make PREFIX="$pkgdir/usr/local" install || return 1
}

