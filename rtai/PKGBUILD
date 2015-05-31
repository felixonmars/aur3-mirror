# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=rtai
pkgver=4.1
# If you wish not to use the most recent kernel
_kernver=3.8.13
pkgrel=1
pkgdesc="RTAI kernel instalation"
arch=(x86_64 i686)
url="http://www.rtai.org/"
license=('GPL')
depends=()
makedepends=( rsync ncurses gcc make patch )
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://www.rtai.org/userfiles/downloads/RTAI/rtai-$pkgver.tar.bz2")
noextract=()
md5sums=('7d7c1774a2008bd95a2ab4aaec4344e9')
validpgpkeys=()


kernel_prepare() {
	kernel_patches=`find $srcdir/rtai-$pkgver/base/arch/x86/patches/*`

	# We select the version we are going to use, either from config or from the newest (always)
	supported_versions=`echo "$kernel_patches" | sed -e 's,.*/hal-linux-,,g' -e 's,-.*,,' | sort -V`
	
	if [ x$_kernver != x ]; then
		if [ `echo "$supported_versions" | grep -e "^$_kernver$"` ]; then
			echo "Using kernel version overrid $_kernver"
		else
			echo "Kernel version not supported, supported versions are" $supported_versions
			exit 1
		fi
	else
		_kernver=`echo "$supported_versions" | tail -n1`
	fi

	# Here we get the configs and the patches from arch repo
	if [[ -d packages ]]; then
		cd packages
		git fetch origin packages/linux:refs/remotes/origin/packages/linux
	else
		git clone git://projects.archlinux.org/svntogit/packages.git --single-branch -b packages/linux packages
		cd packages
	fi

	config_version=$_kernver
	config_commit=`git log --grep "$_kernver" --format="%H %s"  | grep -m 1 upgpkg | cut -c -32`
	while [ ! `echo $config_commit` ]; do
		config_version=`echo $config_version | sed 's/.$//'`
		config_commit=`git log --grep "$config_version" --format="%H %s"  | grep -m 1 upgpkg | cut -c -32`
	done
	echo "Selected commit $config_commit from arch linux configs for kernel version $_kernver"

	git checkout -q $config_commit

	# Here we download the kernel version we need
	cd $srcdir
	echo "Download and/or check linux-$_kernver tarball"
	rsync -P --no-motd rsync://rsync.kernel.org/pub/linux/kernel/v$(echo $_kernver | cut -c 1).x/linux-$_kernver.tar.xz \
	       linux-$_kernver.tar.xz
	tar xf linux-$_kernver.tar.xz

	# Here we deploy the patches and the config
	cd $srcdir/linux-$_kernver
	cat $srcdir/packages/trunk/*.patch| patch -p1 -N || echo "Some patches failed but we continue"
	echo "Patching rtai kernel patch"
	cat $(echo "$kernel_patches" | grep $_kernver) | patch -p1 -N|| echo "Patching failed but we continue"
	if [ 'x86_64' == $CARCH ]; then
		cp $srcdir/packages/trunk/config.x86_64 .config
	else
		cp $srcdir/packages/trunk/config .config
	fi
	sed -i=.orig \
		-e "s,.*CONFIG_LOCALVERSION.*,CONFIG_LOCALVERSION='-rtai'," \
		.config

	cp $srcdir/packages/trunk/linux.preset $srcdir/linux-rtai.preset
	sed -i  -e "s,vmlinuz-linux,vmlinuz-rtai," \
		-e "s,default_image=.*,default_image='/boot/initramfs-rtai.img'," \
		-e "s,fallback_image=.*,fallback_image='/boot/initramfs-rtai-fallback.img'," \
		$srcdir/linux-rtai.preset

	# Here we configure the kernel
	make olddefconfig
	# and configure it more if we wish to
	# make menuconfig
}

rtai_prepare() {
	echo "Starting rtai_prepare"
	cd $srcdir/rtai-$pkgver/
	timeout 5s make oldconfig  &>/dev/null|| echo "Configured RTAI"
	sed -i=.orig \
		-e "s,.*CONFIG_RTAI_LINUXDIR.*,CONFIG_RTAI_LINUXDIR='$srcdir/linux-$_kernver'," \
		-e "s,.*CONFIG_RTAI_CPUS.*,CONFIG_RTAI_CPUS='`nproc`'," \
	       	.rtai_config

}

kernel_build() {
	cd "$srcdir/linux-$_kernver"
	make -j`expr $(nproc) + 1`
}

rtai_build(){
	echo "Starting rtai build"
	cd "$srcdir/rtai-$pkgver"
	make config.status -j`expr $(nproc) + 1`
}

kernel_package() {
	cd $srcdir/linux-$_kernver 

	# Install kernel headers
	mkdir -p $pkgdir/usr/src/linux-$_kernver
	make headers_install INSTALL_HDR_PATH=$pkgdir/usr/src/linux-$_kernver

	# Install modules
	make INSTALL_MOD_PATH=$pkgdir/usr modules_install

	# Correct build path to deployed headers
	rm $pkgdir/usr/lib/modules/$_kernver-rtai/build
	ln -s /usr/src/linux-$_kernver $pkgdir/usr/lib/modules/$_kernver-rtai/build

	# Install image
	mkdir $pkgdir/boot
	cp arch/x86/boot/bzImage $pkgdir/boot/vmlinuz-rtai

	# Remove firmware files, as they are provided by another package
	rm -rf $pkgdir/usr/lib/firmware

	#Install preset file for mkinitcpio
	mkdir -p $pkgdir/etc/mkinitcpio.d
	install -m644 -D $srcdir/linux-${pkgname}.preset $pkgdir/etc/mkinitcpio.d/linux-${pkgname}.preset

	echo "Finished kernel_package"
}

rtai_package() {
	# and config for RTAI userspace
	echo "Starting with rtai install"
	cd "$srcdir/rtai-$pkgver"
	make install DESTDIR=$pkgdir
}

prepare() {
	kernel_prepare
	rtai_prepare
}
build(){
	kernel_build
	rtai_build
}
package(){
	kernel_package
	rtai_package
}

