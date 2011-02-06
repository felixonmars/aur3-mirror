# Maintainer: Daniel J Griffiths <ghost1227@archlinux.us>
# Contributor: damir <damir@archlinux.org>
# Contributor: Manolis Tzanidakis <manolis@archlinux.org>

pkgname=dailystrips
pkgver=1.0.28
pkgrel=2
pkgdesc="A perl script which automatically downloads your favorite online comics from the web."
arch=('i686' 'x86_64')
url="http://dailystrips.sourceforge.net"
license=('GPL2')
depends=('perl-libwww' 'perl-timedate')
source=(http://downloads.sourceforge.net/sourceforge/${pkgname}/${pkgname}-${pkgver}.tar.bz2 \
        http://members.hellug.gr/nkour/dcapplet/files/dailystrips-def.tar.bz2 )
md5sums=('67a9eaa3842f6975803b53d4f73a70b6' \
         '51f29fc1f0f291067f0f0304f69eee0b')

build() {
	cd ${srcdir}/${pkgname}-${pkgver}
	
	perl install.pl --scriptdir=${pkgdir}/usr/bin \
		--sharedir=$pkgdir/usr/share/dailystrips \
		--docdir=.

	# update strips.def:
	cp -f ${srcdir}/strips.def ${pkgdir}/usr/share/dailystrips/strips.def
}
