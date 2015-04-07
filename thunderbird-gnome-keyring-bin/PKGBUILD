# Maintainer: lepokle <devel@leo.von-klenze.de>
pkgname='thunderbird-gnome-keyring-bin'
pkgver=31.6.0
pkgrel=1
pkgdesc="Gnome-keyring integration for Thunderbird (binary distribution)"
arch=('x86_64')
url='http://github.com/lepokle/firefox-gnome-keyring'
license=('GPL')
depends=('thunderbird>=31.2.0' 'gnome-keyring')
makedepends=('zip' 'unzip')
provides=('thunderbird-gnome-keyring')
conflicts=('thunderbird-gnome-keyring')
source=("http://share.von-klenze.de/pacman/thunderbird-gnome-keyring-${pkgver}.xpi")
md5sums=('e30e1a0356d3229fffd5b555d2da23f2')

package()
{
    cd ${srcdir}

    mkdir -p "${pkgdir}/usr/lib/thunderbird/extensions/{6f9d85e0-794d-11dd-ad8b-0800200c9a66}"
    cp -r "${srcdir}"/* "${pkgdir}/usr/lib/thunderbird/extensions/{6f9d85e0-794d-11dd-ad8b-0800200c9a66}"
    rm "${pkgdir}/usr/lib/thunderbird/extensions/{6f9d85e0-794d-11dd-ad8b-0800200c9a66}/thunderbird-gnome-keyring-${pkgver}.xpi"
}


