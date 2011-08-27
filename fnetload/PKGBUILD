# Contributor: Sven Schulz <omee@archlinux.de>

pkgname=fnetload
pkgver=0.1.1
pkgrel=1
pkgdesc="FOG Net Load a graphical network monitor designed to be small and lightweight."
url="http://www.sfr-fresh.com/unix/privat/fnetload-0.1.1.tar.gz/"
license=('GPL')
arch=('i686' 'x86_64')
depends=('gtk')
source=(http://www.sfr-fresh.com/unix/privat/$pkgname-$pkgver.tar.gz)
md5sums=('3f2ea572949315e54c7504ea76bd9fe1')

build() {
	  cd $startdir/src/$pkgname-$pkgver
	    ./configure --prefix=/usr
	  make || return 1
	  make prefix=$startdir/pkg/usr install
	}
