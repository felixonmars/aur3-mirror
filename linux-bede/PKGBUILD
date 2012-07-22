# Maintainer: BlackEagle < ike DOT devolder AT gmail DOT com >
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Thomas Baechler <thomas@archlinux.org>

_kernelname=-bede
pkgbase="linux$_kernelname"
pkgname="linux$_kernelname"
true && pkgname=("linux$_kernelname" "linux$_kernelname-headers")
_basekernel=3.5
_patchver=0
pkgver=$_basekernel
pkgrel=1
arch=('i686' 'x86_64')
license=('GPL2')
url="http://www.kernel.org"
options=(!strip)

source=(
	"http://www.kernel.org/pub/linux/kernel/v3.x/linux-$_basekernel.tar.xz"
	# the main kernel config files
	"config-$_basekernel-desktop.i686"
	"config-$_basekernel-desktop.x86_64"
	# standard config files for mkinitcpio ramdisk
	"linux$_kernelname.preset"
	# sysctl updates for desktop usage picked up from opensuse
	"sysctl-desktop.i686"
	"sysctl-desktop.x86_64"
)
sha256sums=(
	'b985ce383f0cfd940d988d4c99a84899028327aca8c29b420678241f26fdb342'
	'ee1046c7a736b52d67193cc54174da496449407149715bc63dec3be6cac3a502'
	'c3d5c7edff06fc094260c59413b583713a34831a3b0650616cd403bc63480a12'
	'd5bb4aabbd556f8a3452198ac42cad6ecfae020b124bcfea0aa7344de2aec3b5'
	'cce2cd65f49ef30e9f2c977210fcb3f21707b53088615eb737e2bb53c67ca7c9'
	'5d59b290f2ec7354048e24cc52048e104fa91a3ac4c393adbb0e268c129d03e2'
)

# revision patches
if [ $_patchver -ne 0 ]; then
	pkgver=$_basekernel.$_patchver
	_patchname="patch-$pkgver"
	source=( "${source[@]}"
		"http://www.kernel.org/pub/linux/kernel/v3.x/$_patchname.xz"
	)
	sha256sums=( "${sha256sums[@]}"
		''
	)
fi

# extra patches
_extrapatches=(
)
_extrapatchessums=(
)
if [ ${#_extrapatches[@]} -ne 0 ]; then
	source=( "${source[@]}"
		"${_extrapatches[@]}"
	)
	sha256sums=( "${sha256sums[@]}"
		"${_extrapatchessums[@]}"
	)
fi

# some stuff for the AUR parser :p
if [ "aur" == "there" ]; then
	source=(
		"http://www.kernel.org/pub/linux/kernel/v3.x/linux-$_basekernel.tar.xz"
		# the main kernel config files
		"config-$_basekernel-desktop.i686"
		"config-$_basekernel-desktop.x86_64"
		# standard config files for mkinitcpio ramdisk
		"linux$_kernelname.preset"
		# sysctl updates for desktop usage picked up from opensuse
		"sysctl-desktop.i686"
		"sysctl-desktop.x86_64"
	)
fi

build() {
	cd "$srcdir/linux-$_basekernel"
	# Add revision patches
	if [ $_patchver -ne 0 ]; then
		msg2 "apply $_patchname"
		patch -Np1 -i "$srcdir/$_patchname"
	fi

	# extra patches
	for patch in ${_extrapatches[@]}; do
		patch="$(basename "$patch" | sed -e 's/\.\(gz\|bz2\|xz\)//')"
		msg2 "apply $patch"
		patch -Np1 -i "$srcdir/$patch"
	done

	# set configuration
	msg2 "copy configuration"
	if [ "$CARCH" = "x86_64" ]; then
		cat ../config-$_basekernel-desktop.x86_64 >./.config
	else
		cat ../config-$_basekernel-desktop.i686 >./.config
	fi
	if [ "$_kernelname" != "" ]; then
		sed -i "s|CONFIG_LOCALVERSION=.*|CONFIG_LOCALVERSION=\"\U$_kernelname\"|g" ./.config
	fi

	# set extraversion to pkgrel
	msg2 "set extraversion to $pkgrel"
	sed -ri "s|^(EXTRAVERSION =).*|\1 -$pkgrel|" Makefile

	# don't run depmod on 'make install'. We'll do this ourselves in packaging
	sed -i '2iexit 0' scripts/depmod.sh

	# hack to prevent output kernel from being marked as dirty or git
	msg2 "apply hack to prevent kernel tree being marked dirty"
	echo "" > "$srcdir/linux-$_basekernel/.scmversion"

	# get kernel version
	msg2 "prepare"
	make prepare
	# load configuration
	# Configure the kernel. Replace the line below with one of your choice.
	#make menuconfig # CLI menu for configuration
	#make xconfig # X-based configuration
	#make oldconfig # using old config from previous kernel version
	# ... or manually edit .config
	####################
	# stop here
	# this is useful to configure the kernel
	#msg "Stopping build"
	#return 1
	####################
	# yes "" | make config
	# build!
	msg2 "build"
	make $MAKEFLAGS bzImage modules
}

package_linux-bede() {
	pkgdesc="The Linux Kernel and modules, BlackEagle Desktop Edition"
	groups=('base')
	provides=('linux')
	backup=(
		"etc/mkinitcpio.d/$pkgname.preset"
		"etc/sysctl.d/sysctl-$pkgname.conf"
	)
	depends=('coreutils' 'kmod>=9-2' 'mkinitcpio>=0.9')
	optdepends=(
		'crda: to set the correct wireless channels of your country'
		'linux-firmware: when having some hardware needing special firmware'
	)
	replaces=(
		'nouveau-drm' 'kernel26-slk' "kernel26$_kernelname" "linux-bemm"
	)

	install=$pkgname.install

	KARCH=x86
	cd "$srcdir/linux-$_basekernel"

	mkdir -p "$pkgdir"/{lib/modules,lib/firmware,boot,usr}

	# get kernel version
	_kernver=$(make kernelrelease)

	# install modules
	make INSTALL_MOD_STRIP=1 INSTALL_MOD_PATH="$pkgdir" modules_install

	# copy System.map and bzImage
	install -m644 System.map "$pkgdir/boot/System.map$_kernelname"
	install -m644 arch/$KARCH/boot/bzImage "$pkgdir/boot/vmlinuz$_kernelname"

	# install fallback mkinitcpio.conf file and preset file for kernel
	install -m644 -D "$srcdir/$pkgname.preset" "$pkgdir/etc/mkinitcpio.d/$pkgname.preset"

	# install sysctl enhancements
	if [ "$CARCH" = "x86_64" ]; then
		install -Dm644 "$srcdir/sysctl-desktop.x86_64" "$pkgdir/etc/sysctl.d/sysctl-$pkgname.conf"
	else
		install -Dm644 "$srcdir/sysctl-desktop.i686" "$pkgdir/etc/sysctl.d/sysctl-$pkgname.conf"
	fi

	# set correct depmod command for install
	sed \
		-e  "s/KERNEL_NAME=.*/KERNEL_NAME=$_kernelname/g" \
		-e  "s/KERNEL_VERSION=.*/KERNEL_VERSION=$_kernver/g" \
		-i "$startdir/$pkgname.install"
	sed \
		-e "s|source .*|source /etc/mkinitcpio.d/$pkgname.kver|g" \
		-e "s|default_image=.*|default_image=\"/boot/initramfs$_kernelname.img\"|g" \
		-e "s|fallback_image=.*|fallback_image=\"/boot/initramfs$_kernelname-fallback.img\"|g" \
		-i "$pkgdir/etc/mkinitcpio.d/$pkgname.preset"

	echo -e "# DO NOT EDIT THIS FILE\nALL_kver='$_kernver'" > "$pkgdir/etc/mkinitcpio.d/$pkgname.kver"

	# remove build and source links
	rm -f "$pkgdir/lib/modules/$_kernver"/{source,build}

	# remove the firmware
	rm -rf "$pkgdir/lib/firmware"

	_fldkernelname=$(echo $_kernelname | tr "[:lower:]" "[:upper:]")
	# make room for external modules
	ln -s "../${_basekernel}$_fldkernelname-external" "$pkgdir/lib/modules/$_kernver/external"
	# add real version for building modules and running depmod from post_install/upgrade
	mkdir -p "$pkgdir/lib/modules/$_basekernel$_fldkernelname-external"
	echo "$_kernver" > "$pkgdir/lib/modules/${_basekernel}$_fldkernelname-external/version"

	# move module tree /lib -> /usr/lib
	mv "$pkgdir/lib" "$pkgdir/usr/"

	# gzip all modules
	find "$pkgdir" -name '*.ko' -exec gzip -9 {}  \;

	# Now we call depmod...
	depmod -b "$pkgdir" -F System.map "$_kernver"
}

package_linux-bede-headers() {
	pkgdesc="Header files and scripts for building modules for linux$_kernelname"
	provides=('linux-headers')
	replaces=("kernel26$_kernelname-headers" "linux-bemm-headers")
	install -dm755 "$pkgdir/usr/lib/modules/$_kernver"
	cd "$pkgdir/usr/lib/modules/$_kernver"
	ln -sf ../../../src/linux-$_kernver build
	cd "$srcdir/linux-$_basekernel"
	install -D -m644 Makefile \
		"$pkgdir/usr/src/linux-$_kernver/Makefile"
	install -D -m644 kernel/Makefile \
		"$pkgdir/usr/src/linux-$_kernver/kernel/Makefile"
	install -D -m644 .config \
		"$pkgdir/usr/src/linux-$_kernver/.config"

	# copy files necessary for later builds, like nvidia and vmware
	cp Module.symvers "$pkgdir/usr/src/linux-$_kernver"
	cp -a scripts "$pkgdir/usr/src/linux-$_kernver"
	# fix permissions on scripts dir
	chmod og-w -R "$pkgdir/usr/src/linux-$_kernver/scripts"
	mkdir -p "$pkgdir/usr/src/linux-$_kernver/.tmp_versions"

	mkdir -p "$pkgdir/usr/src/linux-$_kernver/arch/$KARCH/kernel"

	cp arch/$KARCH/Makefile "$pkgdir/usr/src/linux-$_kernver/arch/$KARCH/"
	if [ "$CARCH" = "i686" ]; then
		cp arch/$KARCH/Makefile_32.cpu "$pkgdir/usr/src/linux-$_kernver/arch/$KARCH/"
	fi
	cp arch/$KARCH/kernel/asm-offsets.s "$pkgdir/usr/src/linux-$_kernver/arch/$KARCH/kernel/"

	# add docbook makefile
	install -D -m644 Documentation/DocBook/Makefile \
		"$pkgdir/usr/src/linux-$_kernver/Documentation/DocBook/Makefile"

	# add config
	for config in `find ./include/config -size +1c -type f`; do
		mkdir -p "$pkgdir/usr/src/linux-$_kernver/$(dirname $config)"
		cp -a $config "$pkgdir/usr/src/linux-$_kernver/$(dirname $config)"
	done

	# add headers
	for header in `find -size +1c -name '*.h'`; do
		mkdir -p "$pkgdir/usr/src/linux-$_kernver/$(dirname $header)"
		cp -a $header "$pkgdir/usr/src/linux-$_kernver/$(dirname $header)"
	done

	# copy in Kconfig files
	for i in `find . -name "Kconfig*"`; do
		mkdir -p "$pkgdir/usr/src/linux-$_kernver/$(echo $i | sed 's|/Kconfig.*||')"
		cp $i "$pkgdir/usr/src/linux-$_kernver/$i"
	done

	# strip scripts directory
	find "$pkgdir/usr/src/linux-$_kernver/scripts" -type f -perm -u+w 2>/dev/null | while read binary ; do
		case "$(file -bi "$binary")" in
			*application/x-sharedlib*) # Libraries (.so)
				/usr/bin/strip $STRIP_SHARED "$binary"
			;;
			*application/x-archive*) # Libraries (.a)
				/usr/bin/strip $STRIP_STATIC "$binary"
			;;
			*application/x-executable*) # Binaries
				/usr/bin/strip $STRIP_BINARIES "$binary"
			;;
		esac
	done

	chown -R root:root "$pkgdir/usr/src/linux-$_kernver"
	find "$pkgdir/usr/src/linux-$_kernver" -type d -exec chmod 755 {} \;
	# remove unneeded architectures
	rm -rf "$pkgdir/usr/src/linux-$_kernver/arch"/{alpha,arm,arm26,avr32,blackfin,cris,frv,h8300,ia64,m32r,m68k,m68knommu,mips,microblaze,mn10300,parisc,powerpc,ppc,s390,score,sh,sh64,sparc,sparc64,tile,um,v850,xtensa}
}
pkgdesc="The Linux Kernel and modules, BlackEagle Desktop Edition"
