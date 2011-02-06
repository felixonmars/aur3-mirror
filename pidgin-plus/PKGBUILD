# Contributor: adriano <adriano.src gmail com>

pkgname=pidgin-plus
pkgver=0.2.1
pkgrel=2
pkgdesc="A Pidgin plugin which parses the Plus! tags in the buddy list."
arch=('i686' 'x86_64')
url="http://polpoinodroidi.com/2009/10/01/pidgin-plus-con-gradienti"
license=('GPL')
depends=('pidgin')
conflicts=('pidgin-plus-git')
makedepends=('pkgconfig')
source=(https://launchpad.net/~frasten/+archive/ppa/+files/pidgin-plus_0.2.1+git20100610-06e27860.orig.tar.gz)

build() {
  	cd $srcdir/$pkgname-$pkgver*

	./autogen.sh --prefix=/usr
	make || return 1
	make DESTDIR=$startdir/pkg install
}

md5sums=('3289fd260eead3b540d0f30bcd971a60')


