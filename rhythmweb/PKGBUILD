# Contributor: adamruss
pkgname=rhythmweb
pkgver=0.4
pkgrel=1
pkgdesc="Rhythmweb lets you control Rhythmbox remotely, from your web browser."
arch=('i686' 'x86_64')
url="http://web.vee.net/projects/rhythmweb/"
license=('GPL')
depends=('python>=2.5' 'rhythmbox')
source=(http://web.vee.net/projects/$pkgname/$pkgname-$pkgver.tar.bz2)
install=$pkgname.install
md5sums=('b442a7539874cbb392dd43d79c262c56')

build() {
	mkdir -p $pkgdir/usr/lib/rhythmbox/plugins || return 1
	cp -r $srcdir/$pkgname-$pkgver/$pkgname $pkgdir/usr/lib/rhythmbox/plugins || return 1
}
