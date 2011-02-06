pkgname=mkinitcpio-encrypt-sc
pkgver=0.2
pkgrel=1
pkgdesc="A set of initcpio tools for encrypted root & smart card support"
arch=('i686' 'x86_64')
url="http://wiki.archlinux.org/index.php/Smart_Card"
options=('!libtool')
license="LGPL"
depends=('cryptsetup' 'libtool')
makedepends=('automake' 'autoconf')
opensc_ver=0.11.11
openct_ver=0.6.18
source=(http://www.opensc-project.org/files/openct/openct-$openct_ver.tar.gz \
	http://www.opensc-project.org/files/opensc/opensc-$opensc_ver.tar.gz \
	opensc.patch \
	openct.patch \
	encrypt_sc_hook \
	encrypt_sc_install )
md5sums=('f82132df4152a624a04b14a51da79c74'
         '9c3290f7cb82273136b1584e198157dc'
         'e43379e913d46f2f9b3278968dd5266e'
         '649e1070e393f84bad8e7a2540ab8eda'
         'c4298046b6df143f5ad534e524699072'
         '6ea44642e1f93358d0cb22777bb64878')

build() {
	cd $startdir/src/opensc-$opensc_ver
	patch -p1 < $srcdir/opensc.patch
	autoreconf || return 1
	./configure --prefix=/ \
		    --exec-prefix=/ \
		    --sysconfdir=/etc \
		    --enable-openct \
		    --disable-nsplugin \
		    --disable-pcsc \
		    --enable-static || return 1
	make || return 1

 	cd $startdir/src/openct-$openct_ver
	patch -p1 < $srcdir/openct.patch
	autoreconf || return 1
	./configure --prefix=/ \
		    --exec-prefix=/ \
		    --with-udev=/lib/udev \
		    --sysconfdir=/etc \
		    --localstatedir=/var \
		    --enable-usb \
		    --disable-pcsc \
		    --enable-static || return 1
	make || return 1

	install -D $startdir/src/opensc-$opensc_ver/src/tools/pkcs15-tool \
		   $startdir/pkg/lib/initcpio/sc/pkcs15-tool || return 1 
	install -D $startdir/src/opensc-$opensc_ver/etc/opensc.conf \
		   $startdir/pkg/lib/initcpio/sc/opensc.conf || return 1 
	install -D $startdir/src/openct-$openct_ver/src/ifd/ifdhandler \
		   $startdir/pkg/lib/initcpio/sc/ifdhandler || return 1 
	install -D $startdir/src/openct-$openct_ver/src/tools/openct-control \
		   $startdir/pkg/lib/initcpio/sc/openct-control || return 1 
        install -D $startdir/src/openct-$openct_ver/etc/openct.udev.modalias \
		   $startdir/pkg/lib/initcpio/sc/95-openct.rules || return 1 
        install -D $startdir/src/openct-$openct_ver/etc/openct_usb \
		   $startdir/pkg/lib/initcpio/sc/openct_usb || return 1 
        install -D $startdir/src/openct-$openct_ver/etc/openct_pcmcia \
		   $startdir/pkg/lib/initcpio/sc/openct_pcmcia || return 1 
        install -D $startdir/src/openct-$openct_ver/etc/openct_serial \
		   $startdir/pkg/lib/initcpio/sc/openct_serial || return 1
        install -D $startdir/src/openct-$openct_ver/etc/openct.conf \
		   $startdir/pkg/lib/initcpio/sc/openct.conf || return 1
        install -D -m 644 $startdir/src/encrypt_sc_hook \
 		   $startdir/pkg/lib/initcpio/hooks/encrypt_sc || return 1
        install -D -m 644 $startdir/src/encrypt_sc_install \
 		   $startdir/pkg/lib/initcpio/install/encrypt_sc || return 1
}

