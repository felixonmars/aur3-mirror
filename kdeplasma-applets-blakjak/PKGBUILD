#Maintainer: Jonathan Fine <were.Vire@gmail.com>

pkgname=kdeplasma-applets-blakjak
pkgver=1.0
pkgrel=1
pkgdesc='blaKjaK is a simple plasmoid for quick games of Black Jack'
arch=('i686' 'x86_64')
url='http://kde-look.org/content/show.php?content=128705'
license=('GPL')
depends=('kdebase-workspace' 'kdegames-libkdegames')
makedepends=('cmake' 'automoc4')
install=blakjak.install
source=("http://kde-look.org/CONTENT/content-files/128705-blakjak.tar.gz")
md5sums=('e14941e6f2c8667ffbc92ceb99d3c9f4')

build () {
	cd $srcdir/blakjak
	cmake -DCMAKE_INSTALL_PREFIX=/usr . || return 1
	make || return 1
	make DESTDIR=$pkgdir install || return 1
}
