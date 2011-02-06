# Maintainer:  Diego Martin Nieto Cid <dnietoc at gmail dot com>

pkgname=pidgimpd
pkgver=1.1.1
pkgrel=4
pkgdesc="A Pidgin plugin for monitoring/controlling MPD."
arch=('i686' 'x86_64')
url="http://ayeon.org/projects/pidgimpd/"
license=('GPL')
depends=('pidgin' 'libmpd>=0.17.0')
makedepends=('pkgconfig')
provides=('pidgimpd')
conflicts=('pidgimpd-svn')
options=(!libtool)

source=(http://ayeon.org/projects/pidgimpd/pidgimpd-1.1.1.tar.bz2)

md5sums=('c1ce16d9f2071607f66a27554e1e3198')

build() {
 cd $startdir/src/$pkgname-$pkgver
 
 ./configure --prefix=/usr || return 1
 make || return 1
 make DESTDIR=$pkgdir install || return 1 
}
