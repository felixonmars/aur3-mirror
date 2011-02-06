# Contributor: Marc Poiroud <marci1 AT archlinux.fr>
pkgname=pacman.manfr
pkgver=20090803
pkgrel=1
pkgdesc="pages francophone de manuel de Pacman-3.3"
arch=('any')
url="http://archlinux.fr"
license=('GPL')
depends=('pacman>=3.3')
groups='manpagesfr'
source=(http://poiroud.free.fr/linux/archlinux/pacman.manfr/$pkgname-$pkgver.tar.gz)
md5sums=('')

build() {
	cd $startdir/src/$pkgname
	make DESTDIR=$startdir/pkg install
}
