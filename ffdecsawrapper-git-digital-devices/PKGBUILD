# Submitter:   Wessel Dirksen "p-we" <wdirksen at gmail dot com>
# Contributor: Tycho Lürsen "bas-t" (responsible for hosting and development of FFdecsawrapper)
# Contributor: Petr Vacek "vaca" (providing cardslot.conf for serial port SC readers)
# Contributor: J.P. van Best (implementing new procfs API for kernels >= 3.10 in FFdecsawrapper kernel module)

# !!  This package installs the Digital Devices drivers for you. They should not be pre-installed
# !!  As a failsafe, all DD modules will be modprobed at installation (and removed at de-installation)

pkgname=ffdecsawrapper-git-digital-devices
pkgver=0.9.10
pkgrel=2
pkgdesc="FFdecsa empowered softcam (newest generation of open-sasc-ng) - compiled with Digital Devices DVB drivers"
url="http://www.digitaldevices.de"
arch=('i686' 'x86_64')
license=('GPLv3')
makedepends=('linux-headers')
conflicts=('ffdecsawrapper' 'sasc-ng' 'digital-devices-dvb-drivers')
provides=('ffdecsawrapper')
install='ffdecsawrapper-dd.install'

_dddvbver=dddvb-0.9.10
_basekernel=`uname -r | cut -c 1-4`

source=('git://github.com/bas-t/ffdecsawrapper.git#branch=stable' \
	"http://www.kernel.org/pub/linux/kernel/v3.x/linux-$_basekernel.tar.bz2" \
	 http://download.digital-devices.de/download/$_dddvbver.tar.bz2 \
	'cardclient.conf' 'cardslot.conf' 'ffdecsawrapper.conf' 'ffdecsawrapper-dd.install' \
	'ffdecsawrapper.lr' 'ffdecsawrapper.service' 'ffdecsawrapper.rc' 'dddvb-mutex.patch')

sha256sums=('SKIP'
            'SKIP'
            '6fb881bd52296669f56d63fd960264644b519d9b7815013f2964b5726a9984ab'
            '5c23db2b93d1accdc0b3f1612766de38bf7ede5658f6ef973706988dd71d1b81'
            '436eb5a612aa3cb9e45bb2031429f3d41eb596ed65d18659d3bd708919c61253'
            '9bcb2b9c06ce20b2306eb993caeba857e41869e918410d821031a5ca61f444b7'
            'ddb8c2f125091caa796f10ed902b3c64d11077577ff9166b113ac9a2ba424a79'
            'f435344dc9f1c0ed7c2e0de74ec434cd73e2130a0d7589a4d38338e45925d8db'
            '24d13cfc023b5d6cd0d98f720fb96a62e5e29159230508d7174031ce847470e0'
            'a4c1169df845608596c1f20d8c5ca1cc7d9f9a03a8c2e49f5391f942007fe75d'
            '32e05cee7c3c72626e66eddc79f8af2726f9a23db8b3c095472589451d85468d')

pkgver() {

	cd $srcdir/ffdecsawrapper
 	_gitffdecsawrapper=`git describe --always | sed 's|-|.|g'`
	_kernel=`uname -r | sed -r 's/-/_/g'`
	echo "$_gitffdecsawrapper"_"0.9.10"_"$_kernel"
}

prepare() {

	rm -rf "$srcdir/$_dddvbver-build"
	cp -r "$srcdir/$_dddvbver" "$srcdir/$_dddvbver-build"
	
	cd "$srcdir/$_dddvbver-build"
	msg "Applying patches..."
	patch -p1 < $srcdir/dddvb-mutex.patch
	sleep 2
	cp -f $srcdir/$_dddvbver-build/dvb-core/*.* $srcdir/linux-$_basekernel/drivers/media/dvb-core
	make all	
}

build() {

	cd $srcdir/ffdecsawrapper      
	./configure
  
	cd $srcdir/linux-$_basekernel/drivers/media/dvb-core
	make -C /usr/lib/modules/`uname -r`/build M=$(pwd) modules
}

package() {

	mkdir -p $pkgdir/usr/bin
	mkdir -p $pkgdir/etc/conf.d
	mkdir -p $pkgdir/etc/rc.d
	mkdir -p $pkgdir/etc/camdir
	mkdir -p $pkgdir/etc/logrotate.d
	mkdir -p $pkgdir/usr/lib/systemd/system
	mkdir -p $pkgdir/usr/lib/modules/`uname -r`/updates/{dddvb,ffdecsawrapper}

	install -m0644 $srcdir/cardclient.conf  $pkgdir/etc/camdir/cardclient.conf
	install -m0644 $srcdir/cardslot.conf  $pkgdir/etc/camdir/cardslot.conf
	install -m0755 $srcdir/ffdecsawrapper.rc  $pkgdir/etc/rc.d/ffdecsawrapper
	install -m0644 $srcdir/ffdecsawrapper.conf  $pkgdir/etc/conf.d/ffdecsawrapper
	install -m0644 $srcdir/ffdecsawrapper.lr  $pkgdir/etc/logrotate.d/ffdecsawrapper-git-digital-devices.lr
	install -m0644 $srcdir/ffdecsawrapper.service  $pkgdir/usr/lib/systemd/system/ffdecsawrapper.service      

	install -m0755 $srcdir/ffdecsawrapper/ffdecsawrapper  $pkgdir/usr/bin
	install -m0644 $srcdir/ffdecsawrapper/dvbloopback.ko  $pkgdir/usr/lib/modules/`uname -r`/updates/ffdecsawrapper
	install -m0644 $srcdir/linux-$_basekernel/drivers/media/dvb-core/dvb-core.ko  $pkgdir/usr/lib/modules/`uname -r`/updates/ffdecsawrapper
	find "$srcdir/$_dddvbver-build" -name '*.ko' -a ! -name 'dvb-core.ko' -exec cp {} $pkgdir/usr/lib/modules/`uname -r`/updates/dddvb \;
	
	find "$pkgdir" -name '*.ko' -exec gzip -9 {} \;
	chmod 644 -R $pkgdir/usr/lib/modules/`uname -r`/updates
}
