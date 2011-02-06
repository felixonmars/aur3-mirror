# Maintainer marius <marius@habarnam.ro>
# Based on http://aur.archlinux.org/packages.php?ID=13900
# Many thanks to ilikenwf/Matt Parnell <parwok@gmail.com> and Patrick Bartels <p4ddy.b@gmail.com>

pkgname="kernel26-901-git"
pkgver=20100808
pkgrel=1
pkgdesc="Development kernel for EeePc 901 and compatibles. Static kernel."
url="http://www.reddit.com/r/linux/comments/9ozu9/does_anyone_still_build_from_source/c0dtc8o"
arch=("i686" "x86_64")
license=("GPL2")
depends=("coreutils")
makedepends=("git")

_gitname="kernel-901-git"
_gitroot="http://www.kernel.org/pub/scm/linux/kernel/git/torvalds/linux-2.6.git"

source=(
#	"http://git.kernel.org/?p=linux/kernel/git/dwmw2/linux-firmware.git;a=blob_plain;f=rt2860.bin;hb=HEAD"
	"rt2860.bin"
)

md5sums=('7f55011396eff4983f26bb7dd7339fb3')

# Pulls the source tree via GIT
_checkout() {

	if [ ! -d $startdir/src/$_gitname ]; then
		warning "Do not delete src/ as it takes VERY long to clone the kernel sources via GIT"

		msg2 "Cloning the project..."
		git clone $_gitroot $_gitname
	else
		msg "\033[1;33mDo you want to pull the sources first and then build [y/N] ?\033[1;0m"
		read choice;

		# changing directory to the source tree
		cd $startdir/src/$_gitname
		if [ "$choice" = "y" ]; then
			msg "Updating the source tree..."
			git pull origin || return 1 
		fi


		if [ "$_object" != "master" ]; then
			msg "Switching to a new commit: $_object..."
			git checkout -b $_object $_object > /dev/null || return 1 
		fi

		if [ "$choice" = "y" ]; then
            _cleanup
        fi
	fi
}

_cleanup () {
	# cleaning up
	msg "Cleaning up after us"
	if [ "$_object" != "master" ]; then
		git checkout master && \
		git branch -d $_object || \
		warning "You need to remove the branch you used for the current build in order to use it again"
	fi
	# Optimize the local repo
	git gc
}

# Build function called by makepkg
build() {
	_karch="x86"

	msg "Including package configuration..."
	. $startdir/CONFIG 

	# Determine user's build option, continue to build without pulling, or pull then build
	_checkout || return 1 

	cd $startdir/src/$_gitname

	msg "Loading configuration..."
	if [ -e $startdir/config.local ]; then
		msg2 "Using custom kernel config (config.local)..."
		cat $startdir/config.local > .config
	elif [ -e $startdir/config.saved.$CARCH ]; then
		msg2 "Using saved kernel config (config.saved.$CARCH)..."
		cat $startdir/config.saved.$CARCH > .config
	elif [ "$CARCH" = "i686" ]; then
		cat ../config.i686 > .config
	else
		error "Unsupported architecture: $CARCH"
		return 1
	fi

	if [ "$_auto_old_config" = "1" ]; then
		yes "" | make oldconfig ARCH=$_karch
	else
		msg "Updating configuration..."
		make oldconfig ARCH=$_karch
	fi

	case "$_menu_method" in
		menuconfig|xconfig|gconfig)
			msg2 "Running make $_menu_method..."
			make $_menu_method ARCH=$_karch
		;;
	esac

	if [ "$_save_config" = "1" ]; then
		msg "Saving configuration..."
		msg2 "Saving src/$_gitname/.config as config.saved.$CARCH"
		cp .config $startdir/config.saved.$CARCH

		if [ "$_date_localversion" = "1" ]; then
			msg2 "Restoring CONFIG_LOCALVERSION..."
			sed -i "s/^CONFIG_LOCALVERSION=.*$/CONFIG_LOCALVERSION=\"$_localversion\"/" \
				$startdir/config.saved.$CARCH
		fi
	fi

	msg "Building kernel ..."
#	if ! make ARCH=$_karch V="$_verbose" bzImage modules; then
	if ! make ARCH=$_karch V="$_verbose" bzImage; then
		error "Failed... Your source tree might be broken. Run 'make mrproper' in src/$_gitname to clean it up"
		return 1
	fi

	_kernver="$(make kernelrelease ARCH=$_karch)"
	_basekernel="${_kernver/-*/}"

	if [ "$_kernel_pkgver" = "1" ]; then
		msg "Updating pkgver..."
		[ 1 ] && pkgver="${_kernver//-/.}"
	fi

	msg "Updating provides array..."
	[ 1 ] && provides=("${provides[@]}" "kernel26=${_kernver//-/.}" "kernel26-901=${_kernver//-/.}")

	msg "Installing kernel image..."
	install -D -m644 System.map $startdir/pkg/boot/System.map26-901-git
	install -D -m644 arch/$_karch/boot/bzImage $startdir/pkg/boot/vmlinuz26-901-git
	install -D -m644 .config    $startdir/pkg/boot/kconfig26-901-git

	install -D -m644 Makefile        $startdir/pkg/usr/src/linux-$_kernver/Makefile
	install -D -m644 kernel/Makefile $startdir/pkg/usr/src/linux-$_kernver/kernel/Makefile
	install -D -m644 .config         $startdir/pkg/usr/src/linux-$_kernver/.config
	install -D -m644 .config         $startdir/pkg/lib/modules/$_kernver/.config
    
    # installing the rt2860.bin file to /lib/firmware
#    if [ ! -h $srcdir/rt2860.bin ]; then
#        #cp "$srcdir/linux-firmware.git;a=blob_plain;f=rt2860.bin;hb=HEAD" $srcdir/rt2860.bin || return 1
#    fi
    mkdir -p -m755  $startdir/pkg/lib/firmware &&
    cp $srcdir/rt2860.bin $startdir/pkg/lib/firmware/ || return 1

}

#vim: set ts=2 sw=2 noet:
