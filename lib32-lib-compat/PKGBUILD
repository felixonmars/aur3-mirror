# Contributor: mightyjaym <jm.ambrosino@free.fr>
# Maintainer: Anton Larionov <wanton dot clarion at gmail dot com>
# Previous versions you can find here: http://github.com/wanton/pkgbuilds

pkgname=lib32-lib-compat
pkgver=1.4.2
pkgrel=1
pkgdesc="Gentoo lib compat for old programs only available in binary"
arch=('x86_64')
url="http://www.gentoo.org/"
license=('GPL2')
groups=('lib32')
source=(http://distfiles.gentoo.org/distfiles/${pkgname/lib32-/}-${pkgver}.tar.bz2)
md5sums=('62b82bef44dd426dc8569a8d02a46477')

build() {

	cd ${srcdir}/lib-compat-${pkgver}/x86
	install -dm755 "${pkgdir}/usr/lib32/"
	install * "${pkgdir}/usr/lib32/"

}

# vim:set ts=2 sw=2 et:
