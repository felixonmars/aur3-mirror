# Maintainer: MayKiller <imaykiller+aur@gmail~com>

pkgname=gtk-theme-numix-daily
pkgver=2.0
pkgrel=1
pkgdesc="A modern flat theme with a combination of light and dark elements. It supports Gnome, Unity, XFCE and Openbox."
arch=('any')
url="https://github.com/shimmerproject/Numix"
license=('GPL3')
depends=('gtk-engine-murrine')
source=("https://github.com/shimmerproject/Numix/archive/v${pkgver}.tar.gz")

package() {
    install -d ${pkgdir}/usr/share/themes/Numix/
    cp -r ${srcdir}/Numix-${pkgver}/* ${pkgdir}/usr/share/themes/Numix/
}

md5sums=('578c5eaaa999e14cdb7c1d9f142732cc')
