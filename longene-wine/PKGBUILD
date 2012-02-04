# Contributor: Ali H. Caliskan <ali.h.caliskan//gmail.com>
# Contributor: Eduardo Romero <eduardo@archlinux.org>
# Contributor: Bryan Burke <burke.bryan@gmail.com>

pkgname=longene-wine
_origname=wine
_origver=1.0
pkgver=1.0_0.2.4.1
pkgrel=2
pkgdesc="Provides Wine for Longene to emulate Windows 3.x and Win32 APIs."
arch=('i686')
url="http://www.winehq.com"
license=('LGPL')
depends=('longene' 'longene-module' 'fontconfig' 'libldap' 'libxslt' 'lcms' \
	 'libxxf86dga' 'libxcursor' 'libxrandr' 'libxdamage' 'mesa')
makedepends=('cups' 'sane' 'fontforge' 'flex' 'bison' 'libgphoto2' 
             'libxinerama' 'esound' 'giflib' 'ncurses' 'libxcomposite' 'samba' \
             'libxpm' 'libxmu' 'libxxf86vm' 'perl' 'libxml2')
optdepends=("cups" "sane" "libgphoto2" "alsa-lib" "giflib" "libjpeg" "libpng" \
           "perl")
provides=('wine')
conflicts=('wine')
source=("http://prdownloads.sourceforge.net/wine/$_origname-$_origver.tar.bz2"
	'longene.patch')
md5sums=('95e793242aad5031692ab7c35d79e6cd'
	 '4e1e17f974fb5aaeb6b19422d3a1d3d9')

build() {
	cd $srcdir/$_origname-$_origver
	patch -Np1 -i $srcdir/longene.patch
	./configure --prefix=/usr \
	--sysconfdir=/etc --with-x || return 1
	make depend || return 1
	make || return 1
	make prefix=$pkgdir/usr install || return 1
	mkdir -p $pkgdir/etc/wine

	# default longene wine patch is /usr/local/lib/wine
	mkdir -p $pkgdir/usr/local/lib
	cd $pkgdir/usr/local/lib
	ln -s ../../lib/wine wine
}

