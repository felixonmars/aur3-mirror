# Contributor: William Rea <sillywilly@gmail.com>
# Contributor: Lorenzo Nizzi Grifi Gargiolli <lorenzo.nizzi.grifi@gmail.com>
# Maintainer: Oleg Smirnov <oleg.smirnov@gmail.com>
pkgname=openct-hal
pkgver=0.6.20
pkgrel=3
pkgdesc="Implements drivers for several smart card readers for use with HAL"
arch=('i686' 'x86_64')
url="http://www.opensc-project.org/openct"
options=('!libtool')
license=('LGPL')
backup=(etc/openct.conf)
depends=('libtool' 'hal')
optdepends=('pcsclite: for support of PCSC stack')
conflicts=('openct')
provides=('openct')
source=(http://www.opensc-project.org/files/openct/openct-$pkgver.tar.gz \
	openct )
md5sums=('a1da3358ab798f1cb9232f1dbababc21'
         '0f3544b0fad2d31f5249c2381c3e8c03')
_dirname=openct
build() {
	cd $startdir/src/$_dirname-$pkgver
	./configure --prefix=/usr \
		    --sysconfdir=/etc \
		    --localstatedir=/var \
		    --enable-usb \
		    --with-daemon-user=root \
		    --with-daemon-groups=root \
		    --with-bundle=/usr/lib/pcsc/drivers || return 1
	make || return 1
	make DESTDIR=$startdir/pkg install || return 1
	
	install -D -m 644 $startdir/src/$_dirname-$pkgver/etc/openct.fdi \
		      	  $startdir/pkg/etc/hal/fdi/information/10-usb-openct.fdi || return 1
	install -D -m 644 $startdir/src/$_dirname-$pkgver/etc/openct-policy.fdi \
		      	  $startdir/pkg/etc/hal/fdi/policy/10-usb-openct.fdi || return 1
	install -D -m 755 $startdir/src/$_dirname-$pkgver/etc/openct.hald \
		      	  $startdir/pkg/usr/lib/hal/hald-addon-openct || return 1
	install -D -m 644 $startdir/src/$_dirname-$pkgver/etc/openct.conf \
		      	  $startdir/pkg/etc/openct.conf || return 1
	install -D -m 755 $startdir/src/openct \
		      	  $startdir/pkg/etc/rc.d/openct || return 1
	mkdir -p $startdir/pkg/var/run/openct
}
