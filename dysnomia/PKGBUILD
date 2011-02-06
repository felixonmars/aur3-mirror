# Contributor: Benjamin Jorand <benjamin.jorand@gmail.com>
pkgname=dysnomia
pkgver=0.3.4
pkgrel=1
pkgdesc="Dysnomia is a program that shows the possibility to download songs from on-demand music websites (only the deezer.com website in the 0.3.1 version). It's only a proof of concept of that possibility, and it's main interest is in it's code and how it works, not in using it to download songs on these websites."
arch=('i686')
url="http://www.dysnomia-project.org/"
license=('GPL')
depends=('curl' 'wxgtk')
source=(http://dysnomia-project.org/$pkgname-en-$pkgver.tgz)
md5sums=('c6f32805f850e5baa018c7103b241878')

build() {
	cd $startdir/src/$pkgname-en-$pkgver
	make || return 1
	install -d $startdir/pkg/usr/bin
	make DESTDIR=$startdir/pkg/usr/bin install
}

