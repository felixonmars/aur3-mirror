# Maintainer: lepokle <devel@leo.von-klenze.de>
pkgname='firefox-gnome-keyring-bin'
pkgver=37.0.1
pkgrel=1
pkgdesc="Gnome-keyring integration for Firefox (binary distribution)"
arch=('x86_64')
url='http://github.com/lepokle/firefox-gnome-keyring'
license=('GPL')
depends=("firefox>=$pkgver" 'gnome-keyring')
makedepends=('zip' 'unzip')
provides=('firefox-gnome-keyring')
conflicts=('firefox-gnome-keyring')
source=("http://share.von-klenze.de/pacman/firefox-gnome-keyring-${pkgver}.xpi")
md5sums=('002dc632a87d3c9c5dd2552c19322efc')

package()
{
    cd ${srcdir}

    mkdir -p "${pkgdir}/usr/lib/firefox/browser/extensions/{6f9d85e0-794d-11dd-ad8b-0800200c9a66}"
    cp -r "${srcdir}"/* "${pkgdir}/usr/lib/firefox/browser/extensions/{6f9d85e0-794d-11dd-ad8b-0800200c9a66}"
    rm "${pkgdir}/usr/lib/firefox/browser/extensions/{6f9d85e0-794d-11dd-ad8b-0800200c9a66}/firefox-gnome-keyring-${pkgver}.xpi"
}

