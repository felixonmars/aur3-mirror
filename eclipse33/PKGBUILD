# Contributor: Andrew Wright <andreww@photism.org>
# Contributor: Andreas W. Hauser <andy-aur@splashground.de>
# Maintainer: Jonathan Wiersma <archaur at jonw dot org>

pkgname=eclipse33
pkgver=3.3.2
_reldate=200802211800
pkgrel=2
pkgdesc="Eclipse 3.3 (An IDE for Java and other languages)"
arch=('i686' 'x86_64')
url="http://eclipse.org"
depends=('java-environment' 'gtk2' 'unzip' 'xulrunner')
install=eclipse.install
makedepends=('zip')
provides=("eclipse=${pkgver}")
license=("EPL/1.1")
md5sums=(a59b9e8911e59da4cf7a5c5fc6a178e4
         97eeb43cd41bd605224936526678bd4f
         f5963a38c3c8eb3f66d8a1134205056c)
if [ "$CARCH" = "x86_64" ]; then
    _arch=-x86_64
    md5sums=(b0a727dcd931f99d05787ba1970f9b18
             97eeb43cd41bd605224936526678bd4f
	          f5963a38c3c8eb3f66d8a1134205056c)
fi
source=("http://archive.eclipse.org/eclipse/downloads/drops/R-${pkgver}-${_reldate}/eclipse-SDK-$pkgver-linux-gtk$_arch.tar.gz"
       eclipse33.desktop
	    eclipse.ini.patch)

build() {
	cd $srcdir/eclipse || return 1
	
	# patch to increase default memory limits
	patch -p0 < ../eclipse.ini.patch || return 1
	mv eclipse eclipse33
	mv eclipse.ini eclipse33.ini
	
	# install eclipse33
	mkdir -p $pkgdir/usr/share || return 1
	mv $srcdir/eclipse $pkgdir/usr/share/eclipse33 || return 1
	
	# install misc
	mkdir -p $pkgdir/etc/profile.d \
		$pkgdir/usr/share/applications \
		|| return 1
	install -m644 $srcdir/eclipse33.desktop \
	$pkgdir/usr/share/applications/eclipse33.desktop || return 1
}
