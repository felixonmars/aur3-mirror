# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: shamrok <szamrok@gmail.com>
# Contributor: Inxsible <inxsible@gmail.com>
# Contributor: Nathan Owe <ndowens04+AUR at gmail. com>
pkgname=bookreader
pkgver=0.2
pkgrel=1
pkgdesc="Linux KDE electronic book reader"
arch=('i686')
url="http://kbookreader.org/"
license=('GPL')
depends=('kdelibs3')
source=(http://kbookreader.org/system/files/$pkgname-$pkgver.tar.bz2 \
1.patch)

md5sums=('4f9e44121808add979f7e5623734a7db' \
'1ad2ba8aa1ae8d58280516484c3c2d1b')

build() {
	cd ${srcdir}
	patch -p3 < 1.patch
	cd $pkgname-$pkgver
	./configure --prefix=/opt/kde --without-arts
	make || return 1
	make DESTDIR=${pkgdir} install
}
