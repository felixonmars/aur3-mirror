# Contributor: Mateusz Herych <heniekk@gmail.com>
pkgname=yapg
pkgver=0.1beta1
pkgrel=4
pkgdesc="Yet Another Pacman GUI"
arch=('i686' 'x86_64')
url="http://www.brainspace.it/?p=12"
license=('GPL')
depends=('kdelibs')
source=(http://www.brainspace.it/downloads/yapg-0.1-beta1.tar.bz2
	gcc4.3.patch)
md5sums=('b2b5308aaf2d33e28ac5ea30e674377d'
         '89016962f93390d267021beb324dc97c')

build() {
	cd $startdir/src/$pkgname-0.1-beta1
	./configure --prefix=/usr
	patch -p0 < ../gcc4.3.patch
	make || return 1
	make DESTDIR=$startdir/pkg install || return 1

 }

