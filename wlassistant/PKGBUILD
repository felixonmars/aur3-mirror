# Maintainer Jonny Gerold <jonny@fsk141.com 

pkgname=wlassistant
pkgver=0.5.7
pkgrel=3
pkgdesc="Tool to detect and configure wireless networks"
arch=('i686' 'x86_64')
license=('GPLv2')
url="http://wlassistant.sourceforge.net"
depends=('kdelibs3' 'python')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.bz2
	'wlassistant-0.5.5-rpath.patch'
	'wlassistant-0.5.7-fd_cloexec.patch'
	'wlassistant-0.5.7-fix_scons_chmod_error.patch'
	'wlassistant-0.5.7-inline.patch')

md5sums=('4623b498ac42839d08c631c500f18f8b'
         '065b01b60f29676b75c5678a938f84b6'
         '6e66bb5ab5ef9a2cd9fa9854675b5338'
         '3e2b2871d9f19c84d569c519484e3240'
         '9ae34c75358dfb00cbc3e2c9c7a1e748')

build() {
	cd "$srcdir/$pkgname-$pkgver"

	. /etc/profile.d/qt3.sh
	. /etc/profile.d/kde3.sh
	export PATH=$QTDIR/bin:$PATH

	patch -p1 < ../wlassistant-0.5.5-rpath.patch
	patch -p1 < ../wlassistant-0.5.7-fd_cloexec.patch
	patch -p1 < ../wlassistant-0.5.7-fix_scons_chmod_error.patch
	patch -p1 < ../wlassistant-0.5.7-inline.patch

	./configure --prefix=/usr
	make || return 1
	make DESTDIR="$pkgdir" install
}
