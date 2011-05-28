# Maintainer: Tavian Barnes <tavianator@gmail.com>
# Contributor: xduugu
# Contributor: Mathias Burén <mathias.buren@gmail.com>
_pkgext=-nouveau-git
pkgname=kernel26$_pkgext

# required by AUR
# comment the following line to build a single package containing the kernel and the headers
(( 1 )) && pkgname=("kernel26${_pkgext}" "kernel26${_pkgext}-headers" "kernel26${_pkgext}-docs")
pkgdesc="The Linux Kernel and modules from the nouveau project's git tree"
depends=('coreutils' 'linux-firmware-git' 'module-init-tools>=3.12-2' 'mkinitcpio>=0.6.8')

pkgver=20110528
pkgrel=1
url="http://www.kernel.org/"
arch=(i686 x86_64)
license=('GPL2')
makedepends=('git')
source=(config.{i686,x86_64} \
        logo_linux_{clut224.ppm,mono.pbm,vga16.ppm})
md5sums=('3e012dbdf97819c3c86ed001216da0c8'
         'b7fd126a778a09b55ab386bc0fc85437'
         '6a5a1925501fe20fafd04fdb3cb4f6ed'
         'e8c333eaeac43f5c6a1d7b2f47af12e2'
         'c120adbd9c0daa0136237a83adeabd1e')
sha256sums=('5a1ce87bb820d20b020a0cb878a1e030a2be82eeee4bff214ac167e6cb8a7435'
            '3a16f1766e32ad35f16b242d0d330a1f1664ace45434ed7f354b1d2dae62ef97'
            '4274579ccf42a9acc03283edffea2dda2c4a48e3fd734bbaeada4c16dff9d156'
            '1e5bea8de1c2cc24498fb9a4fdbb313f36f38f671f2bfc46ccf7acbd7958a4b9'
            'f9c7c1275313890fc12f6bab92e2c0794b5041e223d868eb0e34cd99baee3d7a')

_gitroot="git://anongit.freedesktop.org/git/nouveau/linux-2.6"
_gitname="linux-2.6"

_linus_gitroot="git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux-2.6.git"


####################################################################
# KERNEL CONFIG FILES
#
# This PKGBUILD searches for config files in the current directory
# and will use the first one it finds from the following
# list as base configuration:
# 	config.local
# 	config.saved.$CARCH
# 	config.$CARCH
#
####################################################################


#############################################################
# PATCHES
#
# This package builds the vanilla git kernel by default,
# but it is possible to patch the source without modifying
# this PKGBUILD.
#
# Simply create a directory 'patches' in your PKGBUILD
# directory and _any_ file (dotfiles excluded) in this
# folder will be applied to the kernel source.
#
# Prefixing the patch file names with dots will obviously
# excluded them from the patching process.
#
#############################################################


#############################
# CONFIGURATION
#
# Uncomment desired options
#############################


#######
# Skip the merge of Linus's kernel tree
#
# _skip_merge=1


#######
# Set to e.g. menuconfig, xconfig or gconfig
#
# For a full list of supported commands, please have a look
# at "Configuration targets" section of `make help`'s output
# or the help target in scripts/kconfig/Makefile ( http://git.kernel.org/?p=linux/kernel/git/torvalds/linux-2.6.git;a=blob;f=scripts/kconfig/Makefile )
#
# If unset or set to an empty or space-only string, the
# (manual) kernel configuration step will be skipped.
#
_config_cmd="${_config_cmd:-nconfig}"


#######
# The directory where the kernel should be built
#
# Can be useful, for example, if you want to compile on a
# tmpfs mount, which can speed up the compilation process
#
_build_dir="${_build_dir:-$srcdir}"


#######
# Stop build process after kernel configuration
#
# This option enables _save_config implicitly.
#
# _configure_only=1


#######
# Append the date to the localversion
#
#	e.g. -ARCH -> -ARCH-20090422
#
# _date_localversion=1


#######
# Set the pkgver to the kernel version
# rather than the build date
#
# _kernel_pkgver=1


#######
# Save the .config file to package directory
# as config.saved.$CARCH
#
# _save_config=1


#######
# Do not compress kernel modules
#
# _no_modules_compression=1


#######
# Make the kernel build process verbose
#
# _verbose=1


# internal variables
if [[ -n $_gitname && -n $_gitroot ]]; then
	(( 1 )) && _kernel_src="$_build_dir/$_gitname-build"
else
	(( 1 )) && _kernel_src="$_build_dir/$(find . -maxdepth 1 -type d -name "linux-*" -printf "%f\n" | head -1)"
fi

#######
# define required functions

# single package
package() {
	eval package_kernel26${_pkgext}-headers
	eval package_kernel26${_pkgext}
}

# split package functions
eval "package_kernel26${_pkgext}() { _generic_package_kernel; }"
eval "package_kernel26${_pkgext}-headers() { _generic_package_kernel-headers; }"
eval "package_kernel26${_pkgext}-docs() { _generic_package_kernel-docs; }"


##############################
# where the magic happens...
##############################
build() {
	#################################
	# Get the latest kernel sources
	#################################
	msg "Fetching sources..."

	cd "$startdir"
	if [[ -d $_gitname ]]; then
		msg2 "Updating sources..."
		cd "$_gitname"
		git fetch origin master:master
		git fetch linus master:linus
		cd "$OLDPWD"
	else
		msg2 "Cloning the project..."
		warning "The initial clone will download approximately 500MB"
		mkdir -p "$_gitname"
		cd "$_gitname"
		git init --bare
		git remote add origin "$_gitroot"
		git remote add linus "$_linus_gitroot"
		git remote update
		git branch --track master origin/master
		git branch --track linus linus/master
		cd "$OLDPWD"
	fi

	msg "Creating build branch..."
	rm -rf "$_kernel_src"
	git clone "$_gitname" "$_kernel_src"
	cd "$_kernel_src"


	################################################################
	# Check out nouveau's tree, merging it onto Linus's if desired
	################################################################
	if [ -n "$_skip_merge" ]; then
		git checkout -q origin/master
	else
		git checkout -q origin/linus
		msg "Merging nouveau onto Linus's kernel tree"
		git merge --no-commit origin/master || true
		# Attempt to resolve conflicts with --theirs
		msg2 "Checking out drivers/gpu/drm/nouveau from the nouveau project"
		git checkout origin/master -- drivers/gpu/drm/nouveau
		git checkout origin/master -- drivers/gpu/drm/ttm
		git add drivers/gpu/drm/nouveau
		git commit -qm "Merge remote branch 'origin/master' into HEAD"
	fi


	####################################
	# Add Arch Linux logo to the source
	####################################
	msg "Adding Arch Linux logo..."
	cp "$srcdir/logo_linux_clut224.ppm" drivers/video/logo/
	cp "$srcdir/logo_linux_mono.pbm"    drivers/video/logo/
	cp "$srcdir/logo_linux_vga16.ppm"   drivers/video/logo/


	#################
	# Apply patches
	#################
	msg "Applying patches..."
	local i patches
	for i in "${source[@]}"; do
		i=${i##*/}
		[[ $i =~ .*\.patch$ ]] && patches=("${patches[@]}" "$srcdir/$i")
		[[ ${i%.*} =~ .*\.patch$ ]] && patches=("${patches[@]}" "$srcdir/${i%.*}")
	done

	shopt -s nullglob
	for i in "${patches[@]}" "$startdir/patches/"*; do
		msg2 "Applying ${i##*/}..."
		patch -Np1 -i "$i" || (error "Applying ${i##*/} failed" && return 1)
	done
	shopt -u nullglob


	#################
	# CONFIGURATION
	#################

	#########################
	# Loading configuration
	#########################
	msg "Loading configuration..."
	for i in local "saved.$CARCH" "$CARCH"; do
		if [[ -e $startdir/config.$i ]]; then
			msg2 "Using kernel config file config.$i..."
			cp -f "$startdir/config.$i" .config
			break
		fi
	done

	[[ ! -e .config ]] &&
		warning "No suitable kernel config file was found. You'll have to configure the kernel from scratch."


	###########################
	# Start the configuration
	###########################
	msg "Updating configuration..."
	yes "" | make config > /dev/null

	# fix lsmod path
	sed -ri "s@s(bin/lsmod)@\1@" scripts/kconfig/streamline_config.pl
	
	if [[ -n ${_config_cmd// /} ]]; then
		msg2 "Running make $_config_cmd..."
		make $_config_cmd
	else
		warning "Unknown config command: $_config_cmd"
	fi


	##############################################
	# Save the config file the package directory
	##############################################
	if [[ -n $_save_config || -n $_configure_only ]]; then
		msg "Saving configuration..."
		msg2 "Saving $_kernel_src/.config as $startdir/config.saved.$CARCH"
		cp .config "$startdir/config.saved.$CARCH"
	fi


	#######################################
	# Stop after configuration if desired
	#######################################
	if [[ -n $_configure_only ]]; then
		rm -rf "$_kernel_src" "$srcdir" "$pkgdir"
		return 1
	fi


	###############################
	# Append date to localversion
	###############################
	if [[ -n $_date_localversion ]]; then
		local _localversion="$(sed -rn 's/^CONFIG_LOCALVERSION="([^"]*)"$/\1/p' .config)"
		[[ -n $_localversion ]] && msg2 "CONFIG_LOCALVERSION is set to: $_localversion"

		# since this is a git package, the $pkgver is equal to $(date +%Y%m%d)
		msg2 "Appending $pkgver to CONFIG_LOCALVERSION..."
		sed -ri "s/^(CONFIG_LOCALVERSION=).*$/\1\"$_localversion-$pkgver\"/" .config
	fi


	#################
	# BUILD PROCESS
	#################

	################################
	# Build the kernel and modules
	################################
	msg "Building kernel and modules..."
	make $MAKEFLAGS V="$_verbose" bzImage modules


	############
	# CLEANUP
	############

	###################################
	# Copy files from build directory
	####################################
	if (( ! CLEANUP )) && [[ $_build_dir != $srcdir ]]; then
		msg "Saving $_kernel_src to $srcdir/${_kernel_src##*/}..."
		mv "$_kernel_src" "$srcdir"
		rm -rf "$_kernel_src"
	fi
}


_generic_package_initialization() {
	cd "$_kernel_src"

	_karch="x86"

	######################
	# Get kernel version
	######################
	_kernver=$(make kernelrelease)
	_basekernel=${_kernver%%-*}


	############################################################
	# Use kernel version instead of the current date as pkgver
	############################################################
	if [[ -n $_kernel_pkgver ]]; then
		pkgver=${_kernver//-/_}
		msg "Setting pkgver to kernel version: $pkgver"
	fi
}

_generic_package_kernel() {
	pkgdesc="The Linux Kernel and modules from Linus' git tree"
	depends=('coreutils' 'linux-firmware-git' 'module-init-tools>=3.12-2' 'mkinitcpio>=0.6.8')
	backup=(etc/mkinitcpio.d/$pkgname.preset)
	install=$pkgname.install
	changelog=$pkgname.changelog

	# set required variables
	_generic_package_initialization


	#############################################################
	# Provide kernel26
	# (probably someone wants to use this kernel exclusively?)
	#############################################################
	provides=("${provides[@]}" "kernel26=${_kernver//-/_}")


	################
	# INSTALLATION
	################

	#####################
	# Install the image
	#####################
	msg "Installing kernel image..."
	install -Dm644 System.map                "$pkgdir/boot/System.map26$_pkgext"
	install -Dm644 arch/$_karch/boot/bzImage "$pkgdir/boot/vmlinuz26$_pkgext"


	##########################
	# Install kernel modules
	##########################
	msg "Installing kernel modules..."
	make INSTALL_MOD_PATH="$pkgdir" modules_install
	[[ -z $_no_modules_compression ]] && find "$pkgdir" -name "*.ko" -exec gzip -9 {} +


	##################################
	# Create important symlinks
	##################################
	msg "Creating important symlinks..."

	# Create generic modules symlink
	if [[ $_kernver != ${_basekernel}${_pkgext} ]]; then
		cd "$pkgdir/lib/modules"
		ln -s "$_kernver" "${_basekernel}${_pkgext}"
		cd "$OLDPWD"
	fi

  # remove header symlinks
	cd "$pkgdir/lib/modules/$_kernver"
		rm -rf source build
		cd "$OLDPWD"


	############################
	# Install mkinitcpio files
	############################
	install -d "$pkgdir/etc/mkinitcpio.d"

	msg "Generating $pkgname.preset..."
	cat > "$pkgdir/etc/mkinitcpio.d/$pkgname.preset" <<EOF
# mkinitcpio preset file for $pkgname

########################################
# DO NEVER EDIT THIS LINE:
source /etc/mkinitcpio.d/$pkgname.kver
########################################

PRESETS=('default')

default_config="/etc/mkinitcpio.conf"
default_image="/boot/$pkgname.img"
EOF

	msg "Generating $pkgname.kver..."
	echo -e "# DO NOT EDIT THIS FILE\nALL_kver='$_kernver'" \
		> "$pkgdir/etc/mkinitcpio.d/$pkgname.kver"


	#######################
	# Update install file
	#######################
	msg "Updating install file..."
	sed -ri "s/^(pkgname=).*$/\1$pkgname/" "$startdir/$pkgname.install"
	sed -ri "s/^(kernver=).*$/\1$_kernver/" "$startdir/$pkgname.install"


	#######################
	# Remove the firmware
	#######################
	rm -rf "$pkgdir/lib/firmware"
}



_generic_package_kernel-headers() {
  pkgdesc="Header files and scripts for building modules for ${pkgname[0]}"
	depends=("${pkgname[0]}")

	# set required variables
	_generic_package_initialization

	#############################################################
	# Provide kernel26
	# (probably someone wants to use this kernel exclusively?)
	#############################################################
	provides=("${provides[@]}" "kernel26-headers=${_kernver//-/_}")


	##############################
	# Install fake kernel source
	##############################
	install -Dm644 Module.symvers  "$pkgdir/usr/src/linux-$_kernver/Module.symvers"
	install -Dm644 Makefile        "$pkgdir/usr/src/linux-$_kernver/Makefile"
	install -Dm644 kernel/Makefile "$pkgdir/usr/src/linux-$_kernver/kernel/Makefile"
	install -Dm644 .config         "$pkgdir/usr/src/linux-$_kernver/.config"
	install -Dm644 .config         "$pkgdir/lib/modules/$_kernver/.config"


	#######################################################
	# Install scripts directory and fix permissions on it
	#######################################################
	cp -a scripts "$pkgdir/usr/src/linux-$_kernver"


	##########################
	# Install header files
	##########################
	msg "Installing header files..."

	for i in net/ipv4/netfilter/ipt_CLUSTERIP.c \
		$(find include/ net/mac80211/ drivers/{md,media/video/} -iname "*.h") \
		$(find include/config/ -type f) \
		$(find . -name "Kconfig*")
	do
		mkdir -p "$pkgdir/usr/src/linux-$_kernver/${i%/*}"
		cp -af "$i" "$pkgdir/usr/src/linux-$_kernver/$i"
	done

	# required by virtualbox and probably others
	ln -s "../generated/autoconf.h" "$pkgdir/usr/src/linux-$_kernver/include/linux/"


	########################################
	# Install architecture dependent files
	########################################
	msg "Installing architecture files..."
	mkdir -p "$pkgdir/usr/src/linux-$_kernver/arch/$_karch/kernel"
	cp -a arch/$_karch/kernel/asm-offsets.s "$pkgdir/usr/src/linux-$_kernver/arch/$_karch/kernel/"

	cp -a arch/$_karch/Makefile* "$pkgdir/usr/src/linux-$_kernver/arch/$_karch/"
	cp -a arch/$_karch/configs "$pkgdir/usr/src/linux-$_kernver/arch/$_karch/"

	# copy arch includes for external modules and fix the nVidia issue
	mkdir -p "$pkgdir/usr/src/linux-$_kernver/arch/$_karch"
	cp -a "arch/$_karch/include" "$pkgdir/usr/src/linux-$_kernver/arch/$_karch/"

	# create a necessary symlink to the arch folder
	cd "$pkgdir/usr/src/linux-$_kernver/arch"

	if [[ $CARCH = "x86_64" ]]; then
		ln -s $_karch x86_64
	else
		ln -s $_karch i386
	fi

	cd "$OLDPWD"


	################################
	# Remove unneeded architecures
	################################
	msg "Removing unneeded architectures..."
	for i in "$pkgdir/usr/src/linux-$_kernver/arch/"*; do
		[[ ${i##*/} =~ ($_karch|Kconfig) ]] || rm -rf "$i"
	done


	############################
	# Remove .gitignore files
	############################
	msg "Removing .gitignore files from kernel source..."
	find "$pkgdir/usr/src/linux-$_kernver/" -name ".gitignore" -delete


	##################################
	# Create important symlinks
	##################################
	msg "Creating important symlinks..."

	# the build symlink needs to be relative
	cd "$pkgdir/lib/modules/$_kernver"
		rm -rf source build
		ln -s "/usr/src/linux-$_kernver" build
		cd "$OLDPWD"

	if [[ $_kernver != ${_basekernel}${_pkgext} ]]; then
		cd "$pkgdir/usr/src"
		ln -s "linux-$_kernver" "linux-${_basekernel}${_pkgext}"
		cd "$OLDPWD"
	fi
}

_generic_package_kernel-docs() {
	pkgdesc="Kernel hackers manual - HTML documentation that comes with the Linux kernel."
	depends=("${pkgname[0]}")

	# set required variables
	_generic_package_initialization

	mkdir -p "$pkgdir/usr/src/linux-$_kernver"
	cp -a Documentation "$pkgdir/usr/src/linux-$_kernver/"
}

# vim: set fenc=utf-8 ts=2 sw=2 noet:
