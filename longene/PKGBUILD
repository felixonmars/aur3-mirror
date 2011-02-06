# Contributor: Ali H. Caliskan <ali.h.caliskan//gmail.com>
# Somewhat based on Arch linux official kernel26 PKGBUILD.

pkgname=longene
_linux26=2.6.30
pkgver=0.2.4.1
pkgrel=2
pkgdesc="Provides kernel level system-call and driver layer to run Windows applications."
arch=('i686')
url="http://www.longene.org/en/index.php"
license=('GPL')
depends=('coreutils' 'mkinitcpio>=0.5.20' 'module-init-tools')
install=('longene.install')
source=("ftp://ftp.kernel.org/pub/linux/kernel/v2.6/linux-$_linux26.tar.bz2"
	"http://www.longene.org/download/unifiedkernel-$pkgver.tar.bz2"
	'longene.preset'
	'longene.kver'
	'config-longene'
	'config-archlinux'
	'unifiedkerneld')
md5sums=('7a80058a6382e5108cdb5554d1609615'
	 '1d805f6471dae6d86bfaf77225937420'
	 '430e7fa30a461a578fe8651752165e20'
	 '0d99a1aa6e5c94e62c80d9b21fa9852b'
	 '5983c538774d7b0aa721a679b8443556'
	 '076daed1c4ff27746291a147839e4f9e'
	 'acb7d033bea6551e0f33524b043d464b')
 
build() {
	# Export the patch dir
	cd $srcdir/unifiedkernel-$pkgver/patches
	export PATCH=`pwd`
	# Patch the Linux kernel
	cd $srcdir/linux-$_linux26
	patch -p1 < $PATCH/unifiedkernel-$pkgver-linux-$_linux26.diff
	# Use archlinux adjusted config file
	#cat $srcdir/config-archlinux > .config
	cat $srcdir/config-longene > .config
	# load configuration
	yes "" | make config
	# Build & install longene linux kernel
	make bzImage modules || return 1
	mkdir -p $pkgdir/{lib/modules,boot}
	make INSTALL_MOD_PATH=$pkgdir modules_install || return 1
	cp System.map $pkgdir/boot/System.map26-uk
	make DESTDIR=$pkgdir install || return 1
	cp arch/i386/boot/bzImage $pkgdir/boot/vmlinuz26-uk
	# install preset and kver file for longene linux kernel
	install -Dm644 $srcdir/$pkgname.preset \
	$pkgdir/etc/mkinitcpio.d/$pkgname.preset || return 1
	install -Dm644 $srcdir/$pkgname.kver \
	$pkgdir/etc/mkinitcpio.d/$pkgname.kver || return 1
	# install the daemon
	install -Dm755 $srcdir/unifiedkerneld \
	$pkgdir/etc/rc.d/unifiedkerneld || return 1

	# remove the firmware directory
	rm -r $pkgdir/lib/firmware

}
