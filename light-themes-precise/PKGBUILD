# Maintainer: Cheer Xiao <xiaqqaix[at]gmail[dot]com>
# Adapted from light-themes PKGBUILD.
# Original author: D. Can Celasun <dcelasun[at]gmail[dot]com>

pkgname=light-themes-precise
_pkgname=light-themes
pkgver=0.1.9.1
_pkgver=$pkgver-0ubuntu1
pkgrel=3
pkgdesc="Ubuntu light themes Ambiance and Radiance (GTK2 & GTK3), latest version from Precise."
arch=(any)
conflicts=(light-themes{,-bzr} {ambiance,radiance}-theme-ubuntu)
url="https://launchpad.net/light-themes/"
license=("CCPL:by-sa")
depends=("gtk-engine-murrine" "ubuntu-mono" "gtk3" "gtk-engine-unico")
source=(https://launchpad.net/ubuntu/precise/+source/$_pkgname/$_pkgver/+files/${_pkgname}_$_pkgver.tar.gz)

build() {
	mkdir -p "$pkgdir"/usr/share/themes/
	cd "$srcdir"/light-themes-${pkgver}/
	cp -r "Ambiance" "$pkgdir/usr/share/themes"
	cp -r "Radiance" "$pkgdir/usr/share/themes"
}

md5sums=('68979fb143401755b45971f7987d55a7')
