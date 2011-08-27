# Contributor: Konrad Szymaszek <konradek26@gmail.com>
pkgname=openadduser
pkgver=1.0
pkgrel=1
pkgdesc="Interactive script for adding new users. Includes automatically user-defined lenght random generated passwords setting."
url="http://strony.it-net.pl/~konradek26/openadduser/"
license="GPL-2"
source=("http://strony.it-net.pl/~konradek26/openadduser/openadduser-1.0")
depends=('pwgen')
arch=('i686' 'x86_64')
md5sums=('ead0dff68622f69cc393ef27c5d77560')

build() {
	cd $startdir/src/
	install -D -m 750 openadduser-1.0 $startdir/pkg/usr/sbin/openadduser
}
