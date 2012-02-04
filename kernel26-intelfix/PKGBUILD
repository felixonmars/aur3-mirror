# Maintainer: rp 
# Originally-uploaded-by: Mathias Burén <mathias.buren@gmail.com>
_pkgext=-intelfix
pkgname=kernel26$_pkgext
pkgver=2.6.36.4
pkgrel=1
pkgdesc="The Linux Kernel $pkgver and modules with a patch trying to fix the blank screen problem for intel"
url="http://www.kernel.org/"
arch=(i686 x86_64)
license=('GPL2')
depends=('coreutils' 'linux-firmware' 'module-init-tools' 'mkinitcpio>=0.5.20')
backup=(etc/mkinitcpio.d/$pkgname.preset)
install=$pkgname.install
source=(logo_linux_{clut224.ppm,mono.pbm,vga16.ppm} \
				intel_screenfix.diff \
				http://www.kernel.org/pub/linux/kernel/v2.6/linux-$pkgver.tar.bz2)
md5sums=('6a5a1925501fe20fafd04fdb3cb4f6ed'
         'e8c333eaeac43f5c6a1d7b2f47af12e2'
         'c120adbd9c0daa0136237a83adeabd1e'
				 'e07af89f28be1d1624978ebb80fc7855'
				 'c05dd941d0e249695e9f72568888e1bf')
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
# Set to e.g. menuconfig, xconfig or gconfig
#
# For a full list of supported commands, please have a look
# at "Configuration targets" section of `make help`'s output
# or the help target in scripts/kconfig/Makefile ( http://git.kernel.org/?p=linux/kernel/git/torvalds/linux-2.6.git;a=blob;f=scripts/kconfig/Makefile )
#
# If unset or set to an empty or space-only string, the
# (manual) kernel configuration step will be skipped.
#
_config_cmd="${_config_cmd:-menuconfig}"
#_config_cmd=""


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
_date_localversion=0


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
# Make the kernel build process verbose
#
# _verbose=1


# internal variables
# work around AUR parser bug
(( 1 )) && _kernel_src="$_build_dir/linux-$pkgver"

##############################
# where the magic happens...
##############################
build() {
	#################################
	# Get the latest kernel sources
	#################################
	cd "$startdir"
	
	cd $srcdir/linux-$pkgver


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
	shopt -s nullglob
	if [[ -d $startdir/patches && -n $(echo "$startdir/patches/"*) ]]; then
		msg "Applying patches..."
		local i
		for i in "$startdir/patches/"*; do
			msg2 "Applying ${i##*/}..."
			patch -Np1 -i "$i" || (error "Applying ${i##*/} failed" && return 1)
		done
	fi
	shopt -u nullglob

	patch -Np1 -i "$srcdir/intel_screenfix.diff" || (error "Applying intel_screenfix.diff" && return 1) 


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

	if [[ ! -e .config ]]; then
		#generate config from /proc/config.gz
		msg "Create .config from /proc/config.gz"
		zcat /proc/config.gz > .config
	fi

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

	#################
	# BUILD PROCESS
	#################

	################################
	# Build the kernel and modules
	################################
	msg "Building kernel and modules..."
	make V="$_verbose" bzImage modules
}

package() {
	local _karch="x86"
	cd "$_kernel_src"

	######################
	# Get kernel version
	######################
	local _kernver=$(make kernelrelease)
	local _basekernel=${_kernver%%-*}

	#############################################################
	# Provide kernel26
	# (probably someone wants to use this kernel exclusively?)
	#############################################################
	provides=("${provides[@]}" kernel26{,-headers}"=${_kernver//-/_}")


	################
	# INSTALLATION
	################

	#####################
	# Install the image
	#####################
	msg "Installing kernel image..."
	install -D -m644 System.map                "$pkgdir/boot/System.map26$_pkgext"
	install -D -m644 arch/$_karch/boot/bzImage "$pkgdir/boot/vmlinuz26$_pkgext"


	##########################
	# Install kernel modules
	##########################
	msg "Installing kernel modules..."
	make INSTALL_MOD_PATH="$pkgdir" modules_install


	##############################
	# Install fake kernel source
	##############################
	install -D -m644 Module.symvers  "$pkgdir/usr/src/linux-$_kernver/Module.symvers"
	install -D -m644 Makefile        "$pkgdir/usr/src/linux-$_kernver/Makefile"
	install -D -m644 kernel/Makefile "$pkgdir/usr/src/linux-$_kernver/kernel/Makefile"
	install -D -m644 .config         "$pkgdir/usr/src/linux-$_kernver/.config"
	install -D -m644 .config         "$pkgdir/lib/modules/$_kernver/.config"


	#######################################################
	# Install scripts directory and fix permissions on it
	#######################################################
	cp -a scripts "$pkgdir/usr/src/linux-$_kernver"
	chmod og-w -R "$pkgdir/usr/src/linux-$_kernver"


	##########################
	# Install header files
	##########################
	msg "Installing header files..."

	# kernel headers
	msg2 "kernel"
	for i in acpi asm-generic config generated linux math-emu media net pcmcia scsi sound trace video; do
		mkdir -p "$pkgdir/usr/src/linux-$_kernver/include/$i"
		cp -a include/$i "$pkgdir/usr/src/linux-$_kernver/include"
	done
	# required by virtualbox and probably others
	ln -s "../generated/autoconf.h" "$pkgdir/usr/src/linux-$_kernver/include/linux/"

	# lirc headers
	msg2 "lirc"
	mkdir -p "$pkgdir/usr/src/linux-$_kernver/drivers/media/video"
	cp drivers/media/video/*.h "$pkgdir/usr/src/linux-$_kernver/drivers/media/video/"

	for i in bt8xx cpia2 cx25840 cx88 em28xx et61x251 pwc saa7134 sn9c102 usbvideo; do
		mkdir -p "$pkgdir/usr/src/linux-$_kernver/drivers/media/video/$i"
		cp -a drivers/media/video/$i/*.h "$pkgdir/usr/src/linux-$_kernver/drivers/media/video/$i"
	done

	# md headers
	msg2 "md"
	mkdir -p "$pkgdir/usr/src/linux-$_kernver/drivers/md"
	cp -a drivers/md/*.h "$pkgdir/usr/src/linux-$_kernver/drivers/md"

	# inotify.h
	msg2 "inotify.h"
	mkdir -p "$pkgdir/usr/src/linux-$_kernver/include/linux"
	cp -a include/linux/inotify.h "$pkgdir/usr/src/linux-$_kernver/include/linux/"

	# CLUSTERIP file for iptables
	msg2 "CLUSTERIP file for iptables"
	mkdir -p "$pkgdir/usr/src/linux-$_kernver/net/ipv4/netfilter/"
	cp -a net/ipv4/netfilter/ipt_CLUSTERIP.c "$pkgdir/usr/src/linux-$_kernver/net/ipv4/netfilter/"

	# wireless headers
	msg2 "wireless"
	mkdir -p "$pkgdir/usr/src/linux-$_kernver/net/mac80211/"
	cp net/mac80211/*.h "$pkgdir/usr/src/linux-$_kernver/net/mac80211/"

	# Kconfig files
	msg2 "Kconfig files"
	for i in $(find . -name "Kconfig*"); do
		mkdir -p "$pkgdir/usr/src/linux-$_kernver/${i%/*}"
		cp -a "$i" "$pkgdir/usr/src/linux-$_kernver/$i"
	done


	########################################
	# Install architecture dependent files
	########################################
	msg "Installing architecture files..."
	mkdir -p "$pkgdir/usr/src/linux-$_kernver/arch/$_karch/kernel"
	cp -a arch/$_karch/kernel/asm-offsets.s "$pkgdir/usr/src/linux-$_kernver/arch/$_karch/kernel"

	cp -a arch/$_karch/Makefile* "$pkgdir/usr/src/linux-$_kernver/arch/$_karch"
	cp -a arch/$_karch/configs "$pkgdir/usr/src/linux-$_kernver/arch/$_karch"

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
	# Create some important symlinks
	##################################
	msg "Creating important symlinks..."

	# the build symlink needs to be relative
	cd "$pkgdir/lib/modules/$_kernver"
		rm -rf source build
		ln -s "/usr/src/linux-$_kernver" build
		cd "$OLDPWD"

	cd "$pkgdir/usr/src"
		ln -s "linux-$_kernver" "linux-${_basekernel}${_pkgext}"
		cd "$OLDPWD"

	cd "$pkgdir/lib/modules"
		ln -s "$_kernver" "${_basekernel}${_pkgext}"
		cd "$OLDPWD"


	###################
	# Fix permissions
	###################
	msg "Fixing permissions..."
	chown -R root:root "$pkgdir/usr/src/linux-$_kernver"
	find "$pkgdir/usr/src/linux-$_kernver" -type d -exec chmod 755 {} +


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


	##########################
	# Remove build directory
	##########################
	if (( ! CLEANUP )) && [[ $_build_dir != $srcdir ]]; then
		msg "Saving $_kernel_src to $srcdir/${_kernel_src##*/}..."
		mv "$_kernel_src" "$srcdir"
	fi
	rm -rf "$_kernel_src"
}

# vim: set fenc=utf-8 ts=2 sw=2 noet:
