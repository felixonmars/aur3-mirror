# Contributor: Patrick Bartels <p4ddy.b@gmail.com>

# Uncomment the line below if you want to maintain the git tree yourself.
#_no_update="y"

# If this variable is set, the PKGBUILD won't clone the repository.
# Instead it will download a snapshot of a working git tree and update it.
# This is a temporary solution to reduce the GIT server's stress.
_use_snapshot="y"

# AUR workaround...
pkgname="zen-kernel"

true && pkgbase="zen-kernel"
true && pkgname=("kernel26-zen" "kernel26-zen-headers")
pkgver="20110120"
pkgrel="6"
pkgdesc="Featureful kernel including various new features, code and optimizations to better suit desktops"
url="http://www.zen-kernel.org"
license=("GPL2")
arch=("i686" "x86_64")
makedepends=("git")
options=("!strip")
source=(kernel26-zen.conf
        kernel26-zen.preset)
md5sums=("ccec126fa0bfce4222a526ca02cf2de8"
         "bd38031713df2bfea42c4fe804958474")

_gitroot="git://zen-kernel.org/kernel/zen-stable.git"
_gitname="zen-sources"

_builddir="$srcdir/build/"
_sourcedir="$srcdir/$_gitname/"

if [ "$_use_snapshot" = "y" ] && [ ! -d "$_sourcedir" ]; then
	source+=(http://downloads.zen-kernel.org/snapshots/zen-stable/linux-2.6-zen.v2.6.36-zen0-full-git.tar.gz)
	md5sums+=("2f8a8fe0ab79bf7cb2ebaff6d0a0b044")
fi

fetch_sources() {
	if [ ! -d "$_gitname" ]; then
		cd "$srcdir"

		if [ "$_use_snapshot" = "y" ]; then
			msg2 "Renaming snapshot directory..."
			mv "$srcdir/linux-2.6-zen" "$_sourcedir"

			_no_update="n" # always perform an update on the very first build
		else
			msg2 "Cloning initial copy of zen-sources..."
			warning "This may take some time depending on your available bandwidth."

			git clone --depth 1 "$_gitroot" "$_gitname"

			_no_update="y" # update is not necessary
		fi
	fi

	if [ "$_no_update" = "y" ]; then
		msg2 "Skipping tree update..."
	else
		cd "$srcdir/$_gitname"

		msg2 "Updating local tree..."
		if git fetch; then
			msg2 "Attempting to merge changes..."

			if ! git merge origin/master; then
				error "Merging failed..."

				msg2 "Fixing local repository..."
				git checkout -f "master"
				git clean -xdf
				git reset --hard "origin/master"
			fi
		else
			error "Update failed..."
		fi

		warning "Press ENTER if you want to continue or CTRL+C to abort..."
		read
	fi
}

build() {
	fetch_sources

	if [ -e "$_builddir/.config" ]; then
		msg2 "Using existing config found in build environment..."
	else
		if [ ! -d "$_builddir" ]; then
			msg2 "Creating build directory..."
			mkdir -p "$_builddir"
		fi

		msg2 "Creating default config..." # also initializes the output directory
		make -C "$_sourcedir" O="$_builddir" defconfig > /dev/null

		warning "This package does not ship a kernel config."

		plain   ""
		warning "Thus it is up to you to create a one that fits your needs."
		warning "Navigate to '$_builddir'"
		warning "and either run 'make menuconfig' or if you want to use an existing config,"
		warning "save it as '.config' and run 'make oldconfig' in order to update it."
		warning "Having done that you can run 'makepkg' again."
		plain   ""

		return 1
	fi

	msg2 "Updating output directory Makefile..."
	make -C "$_sourcedir" O="$_builddir" outputmakefile

	warning "Press ENTER if you want to build the kernel or CTRL+C to abort..."
	read

	cd "$_builddir"
	msg2 "Building kernel..."; make bzImage
	msg2 "Building modules..."; make modules
}

package_kernel26-zen() {
	depends=("coreutils" "linux-firmware" "module-init-tools" "mkinitcpio>=0.5.20")
	optdepends=("kernel26-zen-headers: to build third party modules such as NVIDIA drivers or OSSv4"
	            "crda: to set the correct wireless channels of your country")
	true && conflicts=("kernel26zen")
	backup=(etc/mkinitcpio.d/kernel26-zen.conf)
	install=kernel26-zen.install

	msg2 "Determining kernel name..."
	cd "$_sourcedir"
	_kernver="$(make O="$_builddir" kernelrelease)"
	msg2 "Kernel release name is: $_kernver"

	cd "$_builddir"

	msg2 "Installing kernel image..."
	install -D -m644 "arch/x86/boot/bzImage" "$pkgdir/boot/vmlinuz26-zen"

	msg2 "Installing modules (and firmware files)..."
	make INSTALL_MOD_PATH="$pkgdir" modules_install

	if [ -d "$pkgdir/lib/firmware" ]; then
		msg2 "Removing firmware files..."
		rm -r "$pkgdir/lib/firmware"
	fi

	msg2 "Installing System.map..."
	install -m644 "System.map" "$pkgdir/boot/System.map26-zen"

	msg2 "Removing links to source and build directory..."
	rm "$pkgdir/lib/modules/$_kernver/"{build,source}

	msg2 "Updating kernel version in install script..."
	sed -i "s/_kernel_version=.*/_kernel_version=$_kernver/" \
		"$startdir/kernel26-zen.install"

	msg2 "Installing files for mkinitcpio..."
	install -D -m644 "$srcdir/kernel26-zen.conf" \
		"$pkgdir/etc/mkinitcpio.d/kernel26-zen.conf"
	
	install -D -m644 "$srcdir/kernel26-zen.preset" \
		"$pkgdir/etc/mkinitcpio.d/kernel26-zen.preset"
	sed -i "s/^ALL_kver=.*$/ALL_kver=$_kernver/" \
		"$pkgdir/etc/mkinitcpio.d/kernel26-zen.preset"
}

package_kernel26-zen-headers() {
	# AUR workaround
	true && pkgdesc="Header files and scripts for building modules for kernel26-zen"
	true && depends=("kernel26-zen")
	true && conflicts=("kernel26zen-headers")

	_srcdir="/usr/src/linux-$_kernver"

	msg2 "Installing files necessary for 3rd party modules such as NVIDIA drivers or OSSv4..."
	mkdir -p "$pkgdir/$_srcdir/"{arch/x86,include}
	
	install -D -m644 "$_sourcedir/Makefile" "$pkgdir/$_srcdir/Makefile"
	install -D -m644 "$_sourcedir/kernel/Makefile" "$pkgdir/$_srcdir/kernel/Makefile"
	install -D -m644 "$_builddir/.config" "$pkgdir/$_srcdir/.config"
	install -D -m644 "$_builddir/Module.symvers" "$pkgdir/$_srcdir/Module.symvers"
	install -D -m644 "$_builddir/include/linux/version.h" "$pkgdir/$_srcdir/include/linux/version.h"
	install -D -m644 "$_builddir/arch/x86/kernel/asm-offsets.s" "$pkgdir/$_srcdir/arch/x86/kernel/asm-offsets.s"
	install -D -m644 "$_sourcedir/arch/x86/Makefile" "$pkgdir/$_srcdir/arch/x86/Makefile"

	if [ "$CARCH" = "i686" ]; then
		install -D -m644 "$_sourcedir/arch/x86/Makefile_32.cpu" "$pkgdir/$_srcdir/arch/x86/Makefile_32.cpu"
	fi

	cp -a "$_sourcedir/scripts" "$pkgdir/$_srcdir"
	cp -a "$_builddir/scripts" "$pkgdir/$_srcdir"
	cp -a "$_sourcedir/include" "$pkgdir/$_srcdir"
	cp -a "$_builddir/include/"{generated,config} "$pkgdir/$_srcdir/include"
	cp -a "$_sourcedir/arch/x86/include" "$pkgdir/$_srcdir/arch/x86"

	cd "$_sourcedir"
	{
		find drivers -type f -name "*.h";
		find . -type f -name "Kconfig*";
	} | while read file; do
		install -D -m644 "$file" "$pkgdir/$_srcdir/$file"
	done

	msg2 "Fixing permissions on scripts directory..."
	chmod og-w -R "$pkgdir/$_srcdir/scripts"

	msg2 "Creating symlinks..."
	mkdir -p "$pkgdir/lib/modules/$_kernver/"
	ln -s "$_srcdir" "$pkgdir/lib/modules/$_kernver/build"
	ln -s "$_srcdir" "$pkgdir/lib/modules/$_kernver/source"
}

