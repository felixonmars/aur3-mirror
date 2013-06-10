# $Id$
# Maintainer: Guillaume Cocatre-Zilgien <guillaume at cocatre dot net>
# Contributor: François Charette <firmicus ατ gmx δοτ net> 
# Contributor: Shinlun Hsieh <yngwiexx@yahoo.com.tw>
# Contributor: Michal Hybner <dta081@gmail.com>

pkgname=wavpack-beta
pkgver=4.70.0
pkgrel=3
pkgdesc="Audio compression format with lossless, lossy, and hybrid compression modes"
arch=('i686' 'x86_64')
url="http://www.wavpack.com/"
license=('custom')
depends=('glibc')
options=('!libtool')
provides=('wavpack=4.70.0')
conflicts=('wavpack')
source=('http://www.wavpack.com/wavpack-4.70.0-beta.tar.bz2')
md5sums=('5405ff4fd021059059b334962e218fb7')

build() {
	cd ${srcdir}/${pkgname/-beta/}-${pkgver}
#	export CFLAGS="${CFLAGS/-O1/-O3}"
#	export CFLAGS="${CFLAGS/-O2/-O3}"
#	export CXXFLAGS="$CFLAGS"
	./configure --prefix=/usr --enable-mmx --disable-static
	make
}

package() {
	cd ${srcdir}/${pkgname/-beta/}-${pkgver}
	make DESTDIR=${pkgdir} install
	# the current archive does not contain a license file
}
