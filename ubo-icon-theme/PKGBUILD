# Maintainer: Samsagax <samsagax@gmail.com>

pkgname=ubo-icon-theme
pkgver=0.1alpha
pkgrel=1
pkgdesc="Ubo Icons Theme by UBO. Not glamorous, not glossy, drawn with ballpoint pen, scanned and colored in GIMP"
arch=('any')
url="http://pen-art.ru/"
license=('Artistic2.0')
source="http://pen-art.ru/downloads/icons/ubo-icons-$pkgver.tar.gz"
md5sums=('b6e734927f10cfce323a6bb2232d7ea2')

package() {
    mkdir -p $pkgdir/usr/share/icons/Ubo-Icons
    cp -vr $srcdir/ubo-icons-$pkgver/* $pkgdir/usr/share/icons/Ubo-Icons
}
