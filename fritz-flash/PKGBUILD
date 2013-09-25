# Contributor: Jonas Heinrich <onny@project-insanity.org>
# Maintainer: Jonas Heinrich <onny@project-insanity.org>

pkgname=fritz-flash
pkgver=1
pkgrel=1
pkgdesc="Simple fbox recovery tool"
arch=('any')
url="http://deve.loping.net"
license=('GPL2')
depends=('perl' 'perl-string-crc32')
sha512sums=('b47303419c0f6f337a8cbb6c33b45ee851445cc652495bd32f5327e769e2a27ca612858c4fcd57c17729a88523fd06c9fb415e7035ed885c49a9116c147a5a9c')
source=("http://deve.loping.net/files/${pkgname}")
options=('!strip')

package () {
    install -Dm755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}

# vim:set ts=4 sw=4 et:
