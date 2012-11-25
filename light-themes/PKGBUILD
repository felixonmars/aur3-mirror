# Maintainer: D. Can Celasun <dcelasun[at]gmail[dot]com>

pkgname=light-themes
pkgver=0.1.93
pkgrel=1
pkgdesc="Ubuntu 'light' themes Ambiance and Radiance (GTK2 and GTK3)"
arch=('i686' 'x86_64')
url="https://launchpad.net/light-themes/"
license=("CCPL")
depends=("gtk-engine-murrine" "ubuntu-mono" "gtk3" "gtk-engine-unico")
source=(https://launchpad.net/ubuntu/quantal/+source/${pkgname}/${pkgver}/+files/${pkgname}_${pkgver}.tar.gz)

build() {
	mkdir -p "$pkgdir"/usr/share/themes/
	cd "$srcdir"/light-themes-${pkgver}/
	cp -r "Ambiance" "$pkgdir/usr/share/themes"
	cp -r "Radiance" "$pkgdir/usr/share/themes"
	sed -i -e "/shadow radius/d" "$pkgdir/usr/share/themes/Ambiance/metacity-1/metacity-theme-1.xml"
	sed -i -e "/shadow radius/d" "$pkgdir/usr/share/themes/Radiance/metacity-1/metacity-theme-1.xml"
	sed -i -e "/padding/d" "$pkgdir/usr/share/themes/Ambiance/metacity-1/metacity-theme-1.xml"
	sed -i -e "/padding/d" "$pkgdir/usr/share/themes/Radiance/metacity-1/metacity-theme-1.xml"

	sed -i -e "/trough/d" "$pkgdir/usr/share/themes/Ambiance/metacity-1/metacity-theme-1.xml"
	sed -i -e "/trough/d" "$pkgdir/usr/share/themes/Radiance/metacity-1/metacity-theme-1.xml"

}

md5sums=('57baa4b1ab33288e2f31454fe39be25c')
