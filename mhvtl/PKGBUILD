# Contributor: Stanislav GE <ginermail@gmail.com>

pkgname=mhvtl
pkgver=1.4.8
pkgrel=1
pkgdesc='A Virtual Tape & Library system'
arch=(i686 x86_64)
url=http://sites.google.com/site/linuxvtl2
license=(GPL2)
depends=(sg3_utils)
makedepends=(zlib)
source=($pkgname-pkgver.tar.gz::https://github.com/markh794/${_pkgname}/archive/${pkgver/.8/-8}_release.tar.gz
	mhvtl_destdir.patch)
md5sums=('edbf3cff752f949741523a75be26fc31'
         'b55f5cef71d86a8cbee9f46a7a5f77eb')
install=${pkgname}.install


prepare() {
	cd $srcdir/${pkgname}-${pkgver/.8/-8}_release
	patch -Np0 -i $srcdir/${pkgname}_destdir.patch
}

build() {
	cd $srcdir/${pkgname}-${pkgver/.8/-8}_release
	make USR=root GROUP=root all kernel
}

package() {
	cd $srcdir/${pkgname}-${pkgver/.8/-8}_release
	# Install base
	make USR=root GROUP=root DESTDIR=$pkgdir install

	# Install kernel module
	pushd kernel
	make DESTDIR=$pkgdir install
	popd

	# Install manuals
	install -d $pkgdir/usr/share/man/man{1,5}
	install -D -m 644 $srcdir/${_srcdirname}/man/*.1 $pkgdir/usr/share/man/man1/
	install -D -m 644 $srcdir/${_srcdirname}/man/*.5 $pkgdir/usr/share/man/man5/
}
