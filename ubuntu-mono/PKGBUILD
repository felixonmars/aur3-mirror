# Contributor: William Díaz <wdiaz[at]archlinux[dot]us>
# Contributor: Josip <josipponjavic at gmail dot com>
# Maintainer: Philipp 'TamCore' B. <philipp [at] tamcore [dot] eu>

pkgname=ubuntu-mono
pkgver=0.0.49
pkgrel=1
pkgdesc="Ubuntu Mono Icon theme"
arch=(any)
url="https://launchpad.net/ubuntu/+source/ubuntu-mono"
license=('CCPL')
changelog=ChangeLog
depends=('humanity-icon-theme' 'gnome-icon-theme' 'hicolor-icon-theme' 'librsvg')
install=ubuntu-mono.install
source=(http://launchpad.net/ubuntu/+archive/primary/+files/${pkgname}_${pkgver}.tar.gz)
md5sums=('16f75afeba56a53520bd81969305daca')

package() {
    cd ${srcdir}/${pkgname}-*

    install -d ${pkgdir}/usr/share/icons/
    cp -R "${pkgname}-dark" "${pkgname}-light" ${pkgdir}/usr/share/icons
    install -m644 ${srcdir}/ubuntu-mono-*/debian/changelog ${startdir}/ChangeLog
}

