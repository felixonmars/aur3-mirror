# Contributor: Psykopear <psykopear@gmail.com>
pkgname=sirm2
pkgver=2.3
pkgrel=3
pkgdesc="Script for Installing, removing, backupping, recover script made by the user"
arch=('i686' 'x86_64')
url="http://psykopear.altervista.org"
license=('GPL2')
depends=('sudo' 'bash')
source=(http://psykopear.altervista.org/download/sirm2/$pkgname-$pkgver.tar.gz)
md5sums=('ff9469a430ed4df92f195ca4305035d7')

build () {
cd "$startdir/src/"
install -D -m755 sirm2 $startdir/pkg/usr/bin/sirm2
}
