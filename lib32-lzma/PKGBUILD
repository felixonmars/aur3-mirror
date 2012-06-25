# Contributor: Chris Osgood <archlinux at functionalfuture dot com>
pkgname=lib32-lzma
pkgver=5.0.4
pkgrel=1
pkgdesc="Library for XZ and LZMA compressed files (32-bit)"
arch=('x86_64')
url="http://tukaani.org/xz/"
license=('GPL' 'LGPL' 'custom')
groups=('lib32')
depends=('xz' 'lib32-glibc')
makedepends=('gcc-multilib')
provides=('lib32-xz=5.0.4')
options=(!libtool)
source=(http://tukaani.org/xz/xz-5.0.4.tar.xz)
md5sums=('161015c4a65b1f293d31810e1df93090')

build(){
	cd "${srcdir}"/xz-${pkgver}
	CC='gcc -m32' ./configure --prefix=/usr --libdir=/usr/lib32
	make
}

package() {
	cd "${srcdir}"/xz-${pkgver}
	make DESTDIR="${pkgdir}" install
	rm -rf "${pkgdir}"/usr/{bin,include,share}
	install -d -m755 "${pkgdir}"/usr/share/licenses/lib32-lzma/
	ln -sf /usr/share/doc/xz/COPYING "${pkgdir}"/usr/share/licenses/lib32-lzma/
}

