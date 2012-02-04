# Maintainer: Stanislav GE <ginermail@gmail.com>

pkgname=softbeep
pkgver=0.3
pkgrel=2
pkgdesc="Software Bell for Linux"
arch=(i686)
url=http://0pointer.de/lennart/projects/softbeep
license=(GPL2)
depends=(glibc)
optdepends=(alsa-utils gnome-audio)
source=(http://0pointer.de/lennart/projects/softbeep/$pkgname-$pkgver.tar.gz
	softbeep.patch)
md5sums=('e8dbb0f7cabfc9ac0162370a34c2e259'
         'e7dca99899f2e4127a639a159f4078ff')

build() {
	cd $srcdir/$pkgname
	patch -Np1 -i $startdir/softbeep.patch || return 1
	make PREFIX=/usr || return 1
	make DESTDIR=$pkgdir install || return 1
}
