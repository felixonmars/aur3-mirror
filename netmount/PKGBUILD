# Maintainer: Mark <void+aur[at]voidzero.net>

pkgname=netmount
pkgver=1
pkgrel=1
pkgdesc="A netfs replacement with a stop routine that exits after max 30 seconds"
arch=('i686' 'x86_64')
license=('GPL3')
changelog='CHANGELOG'
url='https://github.com/slacks42/arch-pkgbuilds'
source=(netmount.rc README-archlinux.txt LICENSE.txt)
sha256sums=('556f0869f121592caede4641631a04466a94164a2c323cbb8522c60b40f21275'
            'b81e98dc78111f5f35ec54bd07c8c2d63b1e5633f8e4bba512153b9f1c1ad469'
            '8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903')
package() {
    install -d ${pkgdir}/etc/rc.d ${pkgdir}/usr/share/doc/${pkgname}
    install -m755 ${srcdir}/netmount.rc ${pkgdir}/etc/rc.d/netmount
    install -m644 ${srcdir}/README-archlinux.txt ${srcdir}/LICENSE.txt ${pkgdir}/usr/share/doc/${pkgname}
}
