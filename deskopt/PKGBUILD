# Contributor: Gustavo Chain <g@0xff.cl>
pkgname=deskopt
pkgver=005
pkgrel=2
pkgdesc="The daemon is a Python script that helps to automatically tune the I/O scheduler and the process scheduler to offer better performance for certain applications such as games or audio applications"
arch=('i686' 'x86_64')
url="http://www.stardust.webpages.pl/files/tools/deskopt/"
license=('GPL')
depends=('python')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
groups=()
options=()
source=(http://www.stardust.webpages.pl/files/tools/deskopt/deskopt-005.tar.bz2)
md5sums=('9d54de645c9df413c000002e0cf9390c')

build() {
	install -D -m755 ${startdir}/deskopt.sh ${startdir}/pkg/etc/rc.d/deskopt
	cd $startdir/src/$pkgname-$pkgver
	install -D -m755 deskopt ${startdir}/pkg/usr/bin/deskopt
	install -D -m644 deskopt.conf ${startdir}/pkg/etc/deskopt.conf
}
        
