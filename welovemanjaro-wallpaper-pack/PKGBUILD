# Maintainer: Vinzenz Vietzke <vinz at vinzv.de>
# Curator: welovemanjaro.de

pkgname=welovemanjaro-wallpaper-pack
pkgver=1
pkgrel=1
pkgdesc="A pack of unofficial wallpapers for Arch derivate Manjaro Linux, curated by http://welovemanjaro.de"
arch=('i686' 'x86_64')
url="http://welovemanjaro.de/wallpaper-pack-august-2013/"
license=('unknown: see LICENSE file')
groups=('wallpaper')
source=(http://dl.welovemanjaro.de/packages/wallpaper-pack/pkg-src/${pkgname}.tar.gz)
md5sums=('40952332e123cd21d5fb484c40549ab9')

package() {
install -d ${pkgdir}/usr/share/backgrounds/${pkgname}/*.jpg
install -d ${pkgdir}/usr/share/licenses/${pkgname}
cp -r ${pkgname}/*.jpg ${pkgdir}/usr/share/backgrounds/${pkgname}/
cp -r ${pkgname}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/
}
