pkgname=transmission-svn-seba14
pkgver=10675
pkgrel=5
pkgdesc="A clone of transmission-svn PKGBUILD with seba14 patch: http://tiny.cc/tlpfs."
url="http://www.transmissionbt.com/"
license="MIT"
arch=('i686' 'x86_64')
depends=('curl>=7.16.3' 'openssl>=0.9.4' 'desktop-file-utils' 'hicolor-icon-theme')
provides=('transmission')
conflicts=('transmission-svn' 'transmission')
makedepends=('gtk2>=2.6.0' 'intltool' 'qt>=4.0' 'libevent')
backup=('etc/conf.d/transmissiond')
install=transmission.install
source=(http://download.m0k.org/transmission/files/transmission-2.01.tar.bz2
	transmissiond
	transmissiond.conf
	transmission-svn-leechermod_v0.3.1.patch)
md5sums=('2e896b86fd55c3563ef85cd01a2141a3'
	 '2a87aa815d2702209639719a9179d6fb'
         '7b019a710493ec4f8b54a1f528e1981d'
         '33c60dbc529277f4bd0d5d594f06d518')


_svnmod="transmission-2.01"

build() {
cd $startdir/src


msg "Starting make..."
cd "$srcdir/$_svnmod"

msg "Applying seba14 patch!!!!!!"
(patch -p1 -i $srcdir/transmission-svn-leechermod_v0.3.1.patch) || return 1

msg2 "autogen.sh..."
(./autogen.sh --prefix=/usr) || return 1

msg2 "make"
make -s -j3 || return 1

msg2 "making qtr"
cd "$srcdir/$_svnmod/qt"
qmake qtr.pro || return 1
make -s || return 1

msg2 "make install"
cd "$srcdir/$_svnmod"
make DESTDIR="$pkgdir" install || return 1

msg2 "make install qtr"
cd "$srcdir/$_svnmod/qt"
INSTALL_ROOT="$pkgdir/usr" make install || return 1
#install -D -m755 "$srcdir/$_svnmod/qt/qtransmission" "$pkgdir/usr/bin/qtransmission" || return 1

cd "$srcdir/$_svnmod"
install -D -m755 "$srcdir/transmissiond" "$pkgdir/etc/rc.d/transmissiond" || return 1
install -D -m644 "$srcdir/transmissiond.conf" "$pkgdir/etc/conf.d/transmissiond" || return 1

install -D -m644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING" || return 1
}

