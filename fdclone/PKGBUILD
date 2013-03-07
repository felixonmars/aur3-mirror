# Maintainer: Daichi Shinozaki <dsdseg@gmail.com>
pkgname=fdclone
pkgver=3.01
pkgrel=1
pkgdesc="FDclone is a file & directory maintenance tool"
arch=(i686 x86_64)
url=http://hp.vector.co.jp/authors/VA012337/soft/fd/
license=custom
depends=ncurses
makedepends=ncurses
optdepends=(unzip lha p7zip tar)
backup=etc/$pkgname/fd2rc
source=("http://hp.vector.co.jp/authors/VA012337/soft/fd/FD-3.01.tar.gz")
md5sums=('b3fe07a77d90b34cfcb1c4fe7f83ba02')

_srcdir="$srcdir/FD-$pkgver"

build() {
  cd $_srcdir
  make PREFIX=$pkgdir/usr CONFDIR=/etc/$pkgname
}

package() {
  cd $_srcdir
  make DESTDIR="$pkgdir/" install
  install -d "$pkgdir/etc/$pkgname"
  # config
  sed	-e '/^#DISPLAYMODE=/{s/^#//;s/0/6/;}' \
	-e '/^#ANSICOLOR=/{s/^#//;s/0/1/}' \
	-e '/^#LANGUAGE=/{s/^#//;s/""/en/}' \
	_fdrc > "$pkgdir/etc/$pkgname/fd2rc"
}

# vim:set ts=2 sw=2 et:
