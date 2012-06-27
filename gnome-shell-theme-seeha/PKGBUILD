# Author: Hunterm <http://huntermhaxx.deviantart.com/>
# Base PKGBUILD Author: foalsrock <foalsrock at gmail dot com>
# Maintainer: Hunterm <hunterm dot haxxr at gmail dot com>

pkgname=gnome-shell-theme-seeha
pkgver=20120626
pkgrel=3
pkgdesc="A new GNOME Shell theme meant to be transparent, light, and usable."
url="http://huntermhaxx.deviantart.com/art/Seeha-306444259"
license=('GPL')
arch=('any')
depends=('gnome-shell')
source=("http://www.deviantart.com/download/306444259/seeha_by_huntermhaxx-d52g5wj.zip")
DLAGENTS=('http::/usr/bin/wget -c -t 3 --waitretry=3 -H -U Mozilla -O %o %u')
md5sums=('377e3270a06edeab9e25bb6399acfb15')

package() {
    mkdir -p "${pkgdir}/usr/share/themes"
    cp -r "${srcdir}/Seeha (Bottom Panel)" "${pkgdir}/usr/share/themes/"
    cp -r "${srcdir}/Seeha (Top Panel)" "${pkgdir}/usr/share/themes/"
}

