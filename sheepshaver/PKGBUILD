# Contributor: Angelo Theodorou <encelo@users.sourceforge.net>
pkgname=sheepshaver
pkgver=2.3
pkgrel=1
pkgdesc="An Open Source PowerPC MacOS run-time environment"
url="http://www.gibix.net/dokuwiki/en:projects:sheepshaver"
license="GPL"
depends=('gtk2' 'esd')
source=(http://www.gibix.net/projects/sheepshaver/files/SheepShaver-2.3-0.20060514.1.tar.bz2)
md5sums=('81904c06340fb8101800df864eacedcd')

build() {
  cd $startdir/src/SheepShaver-$pkgver/src/Unix
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
}

