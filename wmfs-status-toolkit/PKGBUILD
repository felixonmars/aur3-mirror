# Maintainer: Armaël Guéneau <mail.armael.gueneau@gmail.com>

pkgname=wmfs-status-toolkit
pkgver=1.0
pkgrel=2
pkgdesc="A C toolkit used to draw graphs and progressbars in the wmfs statusbar"
arch=(any)
url="http://armael.homelinux.org/wmfs/"
license=('BSD')
groups=
provides=
depends=('wmfs')
makedepends=
conflicts=('')
source=(http://freemobilega.power-heberg.com/armael/wmfs//$pkgname-$pkgver.tar.gz)
md5sums=('b785ed428f9a2c354cad31fca71a8a42')

build()
{
	cd $srcdir/$pkgname
	gcc -o wmfs-status-graph graph.c || return 1
	gcc -o wmfs-status-progress progress.c || return 1
	gcc -o wmfs-status-gauge gauge.c || return 1

	mkdir -p $pkgdir/usr/bin
	cp wmfs-status-graph $pkgdir/usr/bin
	cp wmfs-status-progress $pkgdir/usr/bin
	cp wmfs-status-gauge $pkgdir/usr/bin
	chmod +x $pkgdir/usr/bin
}
