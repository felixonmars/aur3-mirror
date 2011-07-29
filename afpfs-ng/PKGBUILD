# Contributor: slubman <slubman.dndd@laposte.net>

pkgname=afpfs-ng
pkgver=0.8.1
pkgrel=1
pkgdesc="A client for the Apple Filing Protocol (AFP) which will let you mount shared volumes from Mac OS X (or netatalk)"
license=('GPL')
depends=('fuse' 'libgcrypt')
arch=('i686' 'x86_64')
source=(http://downloads.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.bz2 libtool.diff)
url="http://alexthepuffin.googlepages.com/"

build() {
	cd $srcdir/$pkgname-$pkgver
	./configure --prefix=/usr || return 1

	(make || (patch -p1 < ../libtool.diff; make)) || return 1

	#make || return 1
	make DESTDIR=$pkgdir install
}

md5sums=('1bdd9f8a06e6085ea4cc38ce010ef60b'
         '3c1a6893b3f0f4057f8d53457b3d96aa')
sha256sums=('688560de1cde57ab8d9e0ef7dc6436dbf0267fe8884f9014e50ff92b297b01a8'
            '20e367c2150f5affb7e371f1b01ba58567367253bc4bc7906c79048f4e9329ff')
