# PKGBUILD for ntopng-svn
# ntopng (C) 2014 - ntop.org (Luca Deri)

# Maintainer: Arianna Avanzini <avanzini@ntop.org>
pkgname=ntopng-svn
pkgver=r8675
pkgrel=1
pkgdesc="High-Speed Web-based Traffic Analysis and Flow Collection"
arch=('i686' 'x86_64')
url="http://www.ntop.org/products/ntop/"
license=('GPL3')
depends=('gd' 'gdbm' 'geoip' 'libnet' 'libpcap' 'libxml2' 'lua' 'pcre'
         'psutils' 'redis' 'rrdtool' 'zeromq')
makedepends=('subversion')
provides=(ntopng)
source=(svn+https://svn.ntop.org/svn/ntop/trunk/ntopng/)
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/ntopng"
	local ver="$(svnversion)"
	printf "r%s" "${ver//[[:alpha:]]}"
}

build() {
	msg 'Starting build...'

	cd "$srcdir/ntopng"
	msg 'Configuring system...'
	./autogen.sh
	./configure
	msg "Building $pkgname..."
	make
	msg 'Downloading GeoIP data...'
	make geoip
}

package() {
	cd "$srcdir/ntopng"
	make DESTDIR="$pkgdir/" install
}
