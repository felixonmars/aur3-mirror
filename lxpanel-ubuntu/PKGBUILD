# Maintainer: Gianfranco 'Gianfrix' Micoli <gianfrix.mg@gmail.com>

pkgname=lxpanel-ubuntu
realname=lxpanel
pkgver=0.5.6
pkgrel=1
pkgdesc="Panel of the LXDE Desktop. With Ubuntu Indicators support"
arch=('i686' 'x86_64')
license=('GPL2')
url="http://lxde.org/"
groups=('lxde')
depends=('gtk2' 'alsa-lib' 'menu-cache' 'lxmenu-data' 'indicator-applet')
provides=('lxpanel=0.5.6')
conflicts=('lxpanel')
source=(http://downloads.sourceforge.net/sourceforge/lxde/${realname}-${pkgver}.tar.gz
        Fix-build-issue-with-symbol-alarm-showing-up-on-F14-.patch
	indicator-support.patch 
	99-autotools.patch)
optdepends=(pcmanfm)
md5sums=('3c6b5498b5f4109c3913b10a66809fe6'
         'afe03191cbeccfc702f9a04bffd62dbf'
         '619db2a91999601aca5093095d4a1d15'
         '139573959f910ed658539cc8b089b2b0')


build() {
	cd "$srcdir/$realname-$pkgver"
	patch -p1 -i $srcdir/Fix-build-issue-with-symbol-alarm-showing-up-on-F14-.patch
	patch -Np1 -i $srcdir/indicator-support.patch 
	patch -p1 -i $srcdir/99-autotools.patch
	autoconf
	./configure --sysconfdir=/etc --prefix=/usr --with-plugins=all --enable-indicator-support
	make
	make DESTDIR="$pkgdir" install
}
