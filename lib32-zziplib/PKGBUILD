#Maintainer: josephgbr <rafael.f.f1@gmail.com>

_pkgbase=zziplib
pkgname=lib32-${_pkgbase}
pkgver=0.13.62
pkgrel=1
pkgdesc="A lightweight library that offers the ability to easily extract data from files archived in a single zip file (32 bit)"
arch=('x86_64')
url="http://zziplib.sourceforge.net"
license=('LGPL' 'MPL')
depends=('lib32-zlib' "${_pkgbase}")
makedepends=('python2' 'gcc-multilib')
options=('!libtool')
source=("http://downloads.sourceforge.net/${_pkgbase}/${_pkgbase}-${pkgver}.tar.bz2")
md5sums=('5fe874946390f939ee8f4abe9624b96c')

build() {
	export CC='gcc -m32'
	export CXX='g++ -m32'
	export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
	export PYTHON='/usr/bin/python2'
	
	cd ${srcdir}/${_pkgbase}-${pkgver}

	./configure --prefix=/usr --libdir=/usr/lib32
	make
}

package() {
	cd ${srcdir}/${_pkgbase}-${pkgver}
	make DESTDIR=${pkgdir} install
	rm -rf ${pkgdir}/usr/{bin,include,share}
}
