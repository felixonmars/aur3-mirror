# Maintainer: Mijo Medvedec <mijo dot medvedec at gmail dot com>

pkgname=thunar-split-view
pkgver=1.6.8
pkgrel=1
pkgdesc="Thunar FM with the split view patches applied"
arch=('i686' 'x86_64')
url="http://docs.xfce.org/xfce/thunar/start"
license=('GPL2' 'LGPL2.1')
depends=('gtk2' 'glib2' 'exo' 'intltool' 'dbus')
conflicts=('thunar')
provides=('thunar=1.6.8')
install=$pkgname.install
source=("http://archive.xfce.org/src/xfce/thunar/1.6/Thunar-${pkgver}.tar.bz2"
	"${pkgname}.install"
	"thunar-standard-view.patch"
	"thunar-window.patch")
md5sums=('d7c6ae92f180c1d8d5b4c3f368142252'
	 'fb051a72d0c4d4e4a0343c12ef09d3a2'
	 '9fc01abb57ab06650336885da2d53a08'
	 '89019182ba615dda06ecde987a64ba1d')
sha256sums=('4079ccffe990cdccee48a0ae200d8a5bc9335c34721d7923b375795940cf79bb'
	    'cb78158bef978da8871406e1797d61ca8b60daa72a9e3ad10cfd02af49d3f9c7'
	    '961fc423b235861161abc881f32737aa77b14b694c33938784b1935f9d8d0cc8'
	    '262582c454de4239f89ca407def3335f88da54e359310eecbcd5314e5283d6dd')

prepare() {
	cd "$srcdir/Thunar-$pkgver"

	# Thunar split view mode ( F3 to enable it )
	# Using a new modified patch files for the 1.6.8 version

	# https://bitbucket.org/snippets/mijomedvedec/k677/untitled-snippet
	# https://bitbucket.org/snippets/mijomedvedec/76qk/untitled-snippet
	patch -p1 -i ../thunar-standard-view.patch
	patch -p1 -i ../thunar-window.patch
}

build() {
	cd "$srcdir/Thunar-$pkgver"

	./configure \
		--prefix=/usr \
		--sysconfdir=/etc \
		--libexecdir=/usr/lib \
		--localstatedir=/var \
		--disable-static \
		--enable-dbus \
		--enable-startup-notification \
		--enable-notifications \
		--enable-gudev \
		--enable-gio-unix
	make
}

package() {
	cd "$srcdir/Thunar-$pkgver"
	make DESTDIR=${pkgdir} install
}
