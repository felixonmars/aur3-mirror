# Contributor: Jonas Heinrich <onny@project-insanity.org>
# Maintainer: Jonas Heinrich <onny@project-insanity.org>

pkgname=libzrtp
pkgver=0.81.514
pkgrel=3
pkgdesc="A library for secure VOIP protocol"
url="http://zfoneproject.com"
arch=('i686' 'x86_64')
license=("custom")
makedepends=('automake' 'autoconf')
source=('http://wakusi.de/download/zfone-linux.tar')
sha512sums=('1feda208fea9d7050f15822a0f8aba9cd1d521a5e41c0ec62e48b733be83d38ce8a7419a2556dd5b7c564142a6fe9b1d42a465a98f01c0e449bde2de76dd3eca')

build() {
	cd $srcdir/zfone-linux
	tar -zxvf ./libzrtp-$pkgver.tar.gz
	cd libzrtp-$pkgver/projects/gnu
	./configure
	sed -i 's/mkdir/mkdir -p/' ../../third_party/bnlib/Makefile
	sed -i 's/\/usr\/local/$(DESTDIR)\/usr\/local/g' ../../third_party/bnlib/Makefile
	sed -i '46i\\tmkdir '\''$(DESTDIR)/usr/local/lib'\''' ../../third_party/bnlib/Makefile
	make 
}

package() {
	cd $srcdir/zfone-linux/libzrtp-$pkgver/projects/gnu
	install -D "COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	make DESTDIR="$pkgdir" install
}
