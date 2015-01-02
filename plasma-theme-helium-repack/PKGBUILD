# Maintainer: Ivan Shapovalov <intelfx100@gmail.com>

pkgname=plasma-theme-helium-repack
pkgver=5.0.0
pkgrel=1
pkgdesc="Fork of Helium, a transparent Plasma theme based on Air and Eleonora."
arch=('any')
license=('CC-BY-NC-SA')
url="http://github.com/intelfx/helium-repack"
depends=('kdebase-workspace') 
source=("http://github.com/intelfx/helium-repack/archive/package-v${pkgver}.tar.gz")

package() {
	mkdir -p "$pkgdir/usr/share/apps/desktoptheme"
	rm -rf "helium-repack-package-v$pkgver/__packaging"
	cp -r "helium-repack-package-v$pkgver" "$pkgdir/usr/share/apps/desktoptheme/Helium Repack"
}

md5sums=('bf7d2a908c7041bb67b8417151309d18')
