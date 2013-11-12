# Maintainer:  Android_808 <android underscore 808 at hotmail dot com>
# Contributor: Pauline123 <321eniluap at gmail dot com>
# Contributor: Shanto <shanto at hotmail>
# Contributor: Piotr Rogoża <rogoza dot piotr at gmail dot com>
pkgname=conky-colors
_pkgname=conky_colors
pkgver=9.0
pkgrel=1
pkgdesc="An easier way to configure Conky."
arch=('i686' 'x86_64')
url="http://gnome-look.org/content/show.php/CONKY-colors?content=92328"
license=('GPL')
depends=('pystatgrab' 'ttf-liberation' 'hddtemp' 'curl' 'lm_sensors' 'conky' 'ttf-droid' 'ttf-ubuntu-font-family' 'ttf-ms-fonts')
makedepends=('perl' 'git')
optdepends=('conky-lua')
options=('!strip')
install=$pkgname.install
source=("$pkgname::git+https://github.com/helmuthdu/conky_colors.git#commit=f4b530a94d")
md5sums=('SKIP')

build() {
	cd "$srcdir/conky-colors"
	make
}

package() {
	cd "$srcdir/conky-colors"
	
	mkdir -p ${pkgdir}/usr/share
	mkdir -p ${pkgdir}/usr/share/fonts
	mkdir -p ${pkgdir}/usr/bin
	cp -v conky-colors ${pkgdir}/usr/bin
	cp -v -r conkycolors ${pkgdir}/usr/share
	#cp -v -r fonts ${pkgdir}/usr/share/conkycolors
	cp -v -r fonts/conkycolors ${pkgdir}/usr/share/fonts/TTF
	ln -fs /usr/share/conkycolors/bin/conkyTask ${pkgdir}/usr/bin/ct
	#ln -fs /usr/share/conkycolors/fonts/conkycolors ${pkgdir}/usr/share/fonts/
	chmod +x ${pkgdir}/usr/share/conkycolors/scripts/*
	chmod +x ${pkgdir}/usr/share/conkycolors/bin/*
	chmod -R 755 ${pkgdir}/usr/share/conkycolors/
}
