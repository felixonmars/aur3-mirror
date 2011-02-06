# Maintainer:VuDu <vudu dot curse at gmail dot com>

pkgname=gnome-carbonate-icon-theme
pkgver=1.1
pkgrel=1
pkgdesc="Carbonate is dark grey and blue hack of various Gnome Colors themes."
arch=('any')
url="http://xfce-look.org/content/show.php?content=120679"
license=('GPL')
source=("http://xfce-look.org/CONTENT/content-files/120679-gnome-carbonate.tar.gz")
md5sums=('6adce519b893bed073ffca12b33361f9')

build() {
    cd "${srcdir}"
    mkdir -p ${pkgdir}/usr/share/icons/
    #chmod a+r -R ${srcdir}/gnome-carbonate/
    cp -R ${srcdir}/gnome-carbonate ${pkgdir}/usr/share/icons/
}

