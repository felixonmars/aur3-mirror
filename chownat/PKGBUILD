# Contributer: Matthew Bauer <mjbauer95@gmail.com>
pkgname=chownat
pkgver=0.08b
pkgrel=1
pkgdesc="chownat, pronounced \"chone nat\", allows two peers behind two separate NATs with NO port forwarding and NO DMZ setup on their routers to directly communicate with each other."
arch=(any)
url="http://samy.pl/chownat"
license=('custom')
depends=('perl' 'perl-digest-md4')
source=(http://samy.pl/chownat/chownat.pl-v${pkgver})
md5sums=('a0a5333d9b835d5420349b3d5f828457')

build() {
	mkdir -p $pkgdir/usr/bin
	cp $srcdir/chownat.pl-v${pkgver} $pkgdir/usr/bin/chownat
	chmod a+x $pkgdir/usr/bin/chownat
}
