# Maintainer: PyroPeter <com . googlemail @ abi1789>
# Contributor: Vitaliy Berdinskikh ur6lad[at]i.ua

pkgname=librxtx-arduino
pkgver=2.2pre2
pkgrel=2
pkgdesc="Java Library for Serial IO"
arch=('i686' 'x86_64')
url="http://rxtx.qbang.org"
depends=('glibc' 'java-runtime')
makedepends=('kernel26-headers' 'gcc' 'java-environment' 'unzip' 'patch')
license=('LGPL')
provides=(rxtx 'librxtx=2.2pre2')
source=(http://rxtx.qbang.org/pub/rxtx/rxtx-${pkgver}.zip utsrelease.patch ttyACM_port.patch)
md5sums=('7eedb18e3f33a427e2b0e9be8ce3f94c' '60e427aaecd29839a5a817f13172be5d' '903a3fe0067d0682dd5f64483c741df6')

build() {
	_kernel=`uname -r`
	CFLAGS=-I/usr/src/linux-${_kernel}/include
	_jhome=$pkgdir/usr/share/java/rxtx
	_rxtx_path=$pkgdir/usr/lib
	mkdir -p ${_jhome} ${_rxtx_path}

	cd $srcdir
	patch -p1 < utsrelease.patch
	cd rxtx-${pkgver}
	
	patch -p1 < ${srcdir}/ttyACM_port.patch
	
	./configure --prefix=/usr || return 1
	make || return 1
	make JHOME=${_jhome} RXTX_PATH=${_rxtx_path} install || return 1

	chmod -x ${_jhome}/RXTXcomm.jar
	# slay libtool
	find $pkgdir -name '*.la' -exec rm {} \;
}
