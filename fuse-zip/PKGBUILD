# Contributor: xtricman#gmail.com

pkgname=fuse-zip
pkgver=0.4.0
pkgrel=1
pkgdesc="A FUSE file system to navigate, extract, create and modify ZIP archives"
arch=('i686' 'x86_64')
url="http://fuse-zip.googlecode.com"
license=('LGPL3')
depends=('fuse' 'libzip')
source=(${url}/files/${pkgname}-${pkgver}.tar.gz)

build() {
	cd ${srcdir}/${pkgname}-${pkgver}

	make release
}

package() {
	cd ${srcdir}/${pkgname}-${pkgver}

	make INSTALLPREFIX=${pkgdir}/usr install

	ln -s fuse-zip ${pkgdir}/usr/bin/mount.zip
}

md5sums=('da2d85c5b28ccd153c928f8030e3f729')
sha256sums=('db9eb13aa250061eaa7df6b1ee5022dbea54089094af94cc3d1767b63bdc9ca7')
