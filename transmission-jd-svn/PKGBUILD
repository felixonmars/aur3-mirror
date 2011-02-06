# Maintainer: JD Horelick <jdhore1 -at- gmail.com>
pkgname=transmission-jd-svn
pkgver=11289
pkgrel=2
pkgdesc="A fast, easy, and free multi-platform BitTorrent client with a focus on being lightweight yet feature-filled. Patchset by jdhore."
url="http://www.transmissionbt.com/"
license="MIT"
arch=('i686' 'x86_64')
depends=('curl>=7.16.3' 'openssl>=0.9.4' 'desktop-file-utils' 'hicolor-icon-theme' 'libevent>=1.4.9')
provides=('transmission')
conflicts=('transmission')
makedepends=('gtk2>=2.6.0' 'subversion' 'intltool' 'qt>=4.0')
backup=('etc/conf.d/transmissiond')
install=transmission.install
source=(transmissiond transmissiond.conf jd-mods-2.patch README)
md5sums=('2a87aa815d2702209639719a9179d6fb'
         '7b019a710493ec4f8b54a1f528e1981d'
		 'bf6f6f8d2d2352cb52b4c9faf6350df1'
		 'df2a1477cfbaaa7c1ac2f9ac0ee78cbc')

_svntrunk="svn://svn.transmissionbt.com/Transmission/trunk"
_svnmod="Transmission"

build() {
cd $startdir/src
mkdir -p ~/.subversion

svn co $_svntrunk $_svnmod
msg "SVN checkout done or server timeout"

msg "Starting make..."
cd "$srcdir/$_svnmod"

# Apply the JD patch
msg "Patching..."
patch -p0 < ../jd-mods-2.patch || return 1

msg2 "autogen.sh..."
(./autogen.sh --prefix=/usr) || return 1

msg2 "make"
make -s || return 1

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
