# Contributor: <disturbed1976@gmail.com>
# Ubuntu's Reselience theme for Gnome
# Resilience-theme by Daniel Holbach <daniel.holbach@ubuntu.com>
# Gion Icon them from Silvestre Herrera 
# http://www.silvestre.com.ar/?p=108

pkgname=resilience-theme
pkgver=0.1
pkgrel=2
pkgdesc="The Resilience theme for Gnome. Thanks to Ubuntu"
arch=('i686' 'x86_64')
url='https://launchpad.net/ubuntu/edgy/i386/resilience-theme/0.1-0ubuntu1'
license=('GPL')
depends=()
makedepends=()
source=(https://launchpad.net/ubuntu/edgy/+source/resilience-theme/0.1-0ubuntu1/+files/resilience-theme_0.1.orig.tar.gz
	http://art.gnome.org/download/themes/icon/1340/ICON-Gion.tar.bz2)
md5sums=('73c4258ab33f3c00bf89d2aed466acda' '0e61aa165084b16c5d3cf0d1d6bf5efd')
	
build() {
	cd $startdir/src/$pkgname-$pkgver
	./configure --prefix=/usr
	make || return 1
	make prefix=$startdir/pkg/usr install || return 1
	sed -i "s/Tangerine/Gion/" $startdir/pkg/usr/share/themes/Resilience/index.theme
	mkdir $startdir/pkg/usr/share/icons/
	cp -r $startdir/src/Gion $startdir/pkg/usr/share/icons/
}

