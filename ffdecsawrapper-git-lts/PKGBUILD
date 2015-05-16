# Submitter:   Wessel Dirksen "p-we" <wdirksen at gmail dot com>
# Contributor: Tycho LÃ¼rsen "bas-t" (responsible for hosting and development of FFdecsawrapper and more)
# Contributor: Petr Vacek "vaca" (contributing code from sascng-linux3-patch and cardslot.conf for serial port SC readers)
# Contributor: J.P. van Best (implementing new procfs API for kernels >= 3.10 in FFdecsawrapper kernel module)
# Contributor: Oliver Endress (providing improved mutex patch for dvbdev.c)

pkgname=ffdecsawrapper-git-lts
pkgver=3.xx
pkgrel=1
pkgdesc="FFdecsa empowered softcam"
url=https://github.com/bas-t/ffdecsawrapper.git
arch=('i686' 'x86_64')
license=('GPLv3')
depends=('v4l-utils')
makedepends=('git' 'linux-lts-headers')
optdepends=('oscam-svn: smartcard reader support' 'linuxtv-dvb-apps: handy DVB tools')
conflicts=('ffdecsawrapper' 'sasc-ng')
provides=('ffdecsawrapper')
backup=('etc/camdir/cardclient.conf' 'etc/conf.d/ffdecsawrapper' 'etc/camdir/cardslot.conf')
install='ffdecsawrapper.install'

_basekernel=`uname -r | cut -c 1-4`

	if [ "$_basekernel" -lt "3.13" ]; then
		_patch="kernel-mutex2.patch"
	else
		_patch="kernel-mutex-new2.patch"
	fi

# !! Alternately you can use "old-stable" or "master" branch by changing line below:

source=('git://github.com/bas-t/ffdecsawrapper.git#branch=stable'
	"http://www.kernel.org/pub/linux/kernel/v3.x/linux-$_basekernel.tar.xz" \
	'cardclient.conf' 'ffdecsawrapper.rc' 'ffdecsawrapper.conf' \
	'ffdecsawrapper.lr' 'cardslot.conf' 'ffdecsawrapper.service' \
	'ffdecsawrapper.install' 'kernel-mutex2.patch' 'kernel-mutex-new2.patch')

sha256sums=('SKIP'
            'SKIP'
            'fb93af1cae8efc580f87f35e17ee84bac6d572fa8944dae5e6eb917c9bbdc470'
            'a4c1169df845608596c1f20d8c5ca1cc7d9f9a03a8c2e49f5391f942007fe75d'
            '6a47f63e46ef863ac8a492fd3573de87303040eca151035449f8296e63875e25'
            'f435344dc9f1c0ed7c2e0de74ec434cd73e2130a0d7589a4d38338e45925d8db'
            '4bd879b7b9233283dfbb9ccc5f4a37b40de95c4cfa48082b9b48c837294d100f'
            'e798aacd050c078083a477b1fc393fa2dacf9b413ab8fea5a80449d3423c2b22'
            'd6ceef7a559ad49722663b4f0b2762ff1ebce3801dd56cd801c24112c9a0cba9'
            '6e73d5b2280fecb5d19f5f45d6d746f174e99505270ea5b5bc9fcc1a8428d0ae'
            '515bb3888bb675257f5b4305d3725ef2c6977520ad5ae649199895b4422b6034')

pkgver() {

	cd $srcdir/ffdecsawrapper
 	_gitver=`git describe --always | sed 's|-|.|g'`
	_kernel=`uname -r | sed -r 's/-/_/g'`
	echo "$_gitver"_"$_kernel"
}

prepare() {

	msg "Applying kernel-mutex patch..."
	cd $srcdir/linux-$_basekernel
	patch -p1 < $srcdir/$_patch
}

build() {
 
    cd $srcdir/linux-$_basekernel/drivers/media/dvb-core
    make -C /usr/lib/modules/`uname -r`/build M=$(pwd) modules

    cd $srcdir/ffdecsawrapper
    ./configure --update=no
}

package() {

	mkdir -p $pkgdir/usr/bin
	mkdir -p $pkgdir/usr/lib/modules/`uname -r`/updates/ffdecsawrapper
	mkdir -p $pkgdir/etc/conf.d
	mkdir -p $pkgdir/etc/rc.d
	mkdir -p $pkgdir/etc/camdir
	mkdir -p $pkgdir/etc/logrotate.d/
	mkdir -p $pkgdir/usr/lib/systemd/system/
      
	install -m0755 $srcdir/ffdecsawrapper/ffdecsawrapper  $pkgdir/usr/bin/
	install -m0755 $srcdir/ffdecsawrapper/dvbloopback.ko  $pkgdir/usr/lib/modules/`uname -r`/updates/ffdecsawrapper
	install -m0755 $srcdir/ffdecsawrapper.rc  $pkgdir/etc/rc.d/ffdecsawrapper
	install -m0644 $srcdir/ffdecsawrapper.conf  $pkgdir/etc/conf.d/ffdecsawrapper
	install -m0644 $srcdir/cardclient.conf  $pkgdir/etc/camdir/cardclient.conf
	install -m0644 $srcdir/cardslot.conf  $pkgdir/etc/camdir/cardslot.conf
	install -m0644 $srcdir/ffdecsawrapper.lr  $pkgdir/etc/logrotate.d/ffdecsawrapper-git.lr
	install -m0644 $srcdir/ffdecsawrapper.service  $pkgdir/usr/lib/systemd/system/ffdecsawrapper.service
	install -m0755 $srcdir/linux-$_basekernel/drivers/media/dvb-core/dvb-core.ko  $pkgdir/usr/lib/modules/`uname -r`/updates/ffdecsawrapper
	find "$pkgdir" -name '*.ko' -exec gzip -9 {} \;
}

