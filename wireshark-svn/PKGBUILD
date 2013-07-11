# Maintainer: Alex Brinister <alex_brinister at yahoo dot com>
pkgname=wireshark-svn
pkgver=50510 
pkgrel=1
pkgdesc="A free network protocol analyzer for Unix/Linux. SVN version"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('gtk2' 'libpcap' 'gnutls' 'c-ares' 'e2fsprogs' 'lua' 'portaudio' 'geoip' 'libsmi' 'perl-parse-yapp' 'python2')
makedepends=('subversion')
url="http://www.wireshark.org/"
sha512sums=('6e1eab7793a97377017be9126b7d25bd9c10d2b0e06be1e83e66ac2ea64dce5c4f8f7783d483921867241d298eb0ac82ff3f9910e90c2065125bff9a3856f52e'
			'b421575dbc3d496a8c3d5485929c161c06d3403bff2fef4f1db07b1db729ca173c6e89cb648d127c02800359975d5e0880c344dc58fa9d24dde570a862bdd7d4'
			'SKIP')
replaces=('ethereal')
provides=('wireshark')
_svnmod='wireshark'
source=("wireshark.desktop"
		"wireshark.png"
		"$_svnmod::svn+http://anonsvn.wireshark.org/wireshark/trunk")
conflicts=('wireshark-gtk')
options=('strip' '!libtool')

pkgver() {
	cd $SRCDEST/$_svnmod
	svnversion | tr -d [A-z]
}

build() {
	cd $srcdir/$_svnmod
	./autogen.sh
	
	mkdir $srcdir/build
	cd $srcdir/build
	
	/usr/lib/python2.7/Tools/scripts/reindent.py $srcdir/$_svnmod/tools/ncp2222.py

	$srcdir/$_svnmod/configure \
	--prefix=/usr \
	--with-ssl \
	--with-zlib=yes \
	--with-lua=/usr/include/ \
	--with-portaudio \
	--with-python=/usr/bin/python2 \
	--enable-aircap \
	LDFLAGS="-llua" \
	CFLAGS="-Wno-error=old-style-definition -Wno-error=clobbered -Wno-error=unused-but-set-variable -fno-unit-at-a-time"

	make ${MAKEFLAGS} PYTHON=/usr/bin/python2 
}

package() {
	cd $srcdir/build
	make ${MAKEFLAGS} DESTDIR=${pkgdir} install
	
	install -Dm644 ${srcdir}/wireshark.png ${pkgdir}/usr/share/icons/wireshark.png
	install -Dm644 ${srcdir}/wireshark.desktop ${pkgdir}/usr/share/applications/wireshark.desktop

	cd $pkgdir/usr/lib/
	ln -s libwsutil.so.0 libwsutil.so.2
	ln -s libwiretap.so.0 libwiretap.so.2
}

# vim:set ts=2 sw=2:
