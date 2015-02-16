# Maintainer: felix <at yandex dot com, local part isaev preceded by m dot p dot>
pkgbase=grub2-git

### PACKAGE CONFIGURATION
pkgname=(
	grub2-x86_64-efi-git
	grub2-i386-pc-git
	grub2-i386-efi-git
	grub2-i386-qemu-git
	grub2-emu-git
	grub2-common-git
	grub2-doc-git
)

_extras=(
	'lua'
	'ntldr-img'

	## does not build as of this writing because of missing floating point
	## emulation routines (gtf_timngs in 915resolution.c)
	# '915resolution'
)

options=()

_conf_all=(--disable-werror)
_conf_emu=(--with-bootdir='/usr/lib')

### PACKAGE BUILD INSTRUCTIONS
source=(grub::'git://git.savannah.gnu.org/grub.git#branch=master')
sha256sums=('SKIP')

pkgver=2.02+beta2+289+g8f5ebb1
pkgrel=1
pkgdesc="GNU GRand Unified Bootloader: the ultimate package (git snapshot)"
arch=(i686 x86_64)
url="http://gnu.org/software/grub/"
license=('GPL3')
groups=()
depends=()
makedepends=('git' 'python2')
checkdepends=('xorriso')
provides=()
replaces=()
backup=()

if [[ "${#_extras}" -gt 0 ]]; then
	source+=(grub-extras::'git://git.savannah.nongnu.org/grub-extras.git')
	sha256sums+=(SKIP)
fi

source+=(
	archlinux_grub_mkconfig_fixes.patch
	autogen_python2.patch
	grub-install-on-none.patch
	grub-doc.install
	grub-notice.install
)

sha256sums+=(
	'729168cd3df5b21cc613bf74a1f923bcf79ad3db99c1eb81e9be31aaf3211891'
	'7bd63e530e2c26d46da60949d43149dba29e21a9d1614a85038fe3269949e434'
	'124a1c7496dfd27bd2ac213030fafc6646bc16fd74ade2bbaca59bb679253b35'
	'2723edf8401e45fc85fa94b57273ae5c9cf65d9ec531ddc616f3f3d87643e571'
	'1b0da01d4ad2b9eefb1331f41d4c88f7fd85c7eb10605579f40953248e466b17'
)

pkgver() {
	cd "$srcdir/grub"
	git describe --tags | sed -e 's/^grub-//' | tr -- - +
}

prepare() {
	cd "$srcdir/grub"
	if [[ "${#_extras}" -gt 0 ]]; then
		msg2 "Preparing extras"
		mkdir -p "$srcdir/extras"
		rm -f "$srcdir/extras"/*
		for _item in "${_extras[@]}"; do
			ln -sf "../grub-extras/$_item" "$srcdir/extras"
		done
	fi

	msg2 "Applying patches"
	patch -p1 < "$srcdir/archlinux_grub_mkconfig_fixes.patch"
	patch -p1 < "$srcdir/autogen_python2.patch"
	patch -p1 < "$srcdir/grub-install-on-none.patch"

	msg2 "Importing translations"
	./linguas.sh
}

build() {
	export GRUB_CONTRIB="$srcdir/extras"

	cd "$srcdir/grub"
	msg2 "Generating configure script"
	./autogen.sh

	for _item in "${pkgname[@]}"; do
		_item="${_item#grub2-}"
		_item="${_item%-git}"
		if [[ "$_item" = 'doc' || "$_item" = 'common' ]]; then
			_build_none=1
			continue
		fi

		_plat="${_item#*-}"
		_cpu="${_item%-*}"
		if [[ "$_cpu" = "$_plat" ]]; then
			_cpu=""
		fi
		_conf=("${_conf_all[@]}")
		eval "_conf+=(\"\${_conf_$_cpu[@]}\" \"\${_conf_$_plat[@]}\")"

		cd "$srcdir"
		rm -rf "build-$_item"
		msg2 "Configuring for $_item"
		mkdir -p "build-$_item"

		cd "$srcdir/build-$_item"
		eval "_CFLAGS=\"\$_CFLAGS_$_cpu \$_CFLAGS_$_plat\""
		eval "_LDFLAGS=\"\$_LDFLAGS_$_cpu \$_LDFLAGS_$_plat\""
		eval "_CPPFLAGS=\"\$_CPPFLAGS_$_cpu \$_CPPFLAGS_$_plat\""
		../grub/configure --quiet \
			--target="$_cpu" \
			--with-platform="$_plat" \
			--program-prefix='' \
			--prefix="/usr" \
			--bindir="/usr/bin" \
			--sbindir="/usr/bin" \
			--mandir="/usr/share/man" \
			--infodir="/usr/share/info" \
			--datarootdir="/usr/share" \
			--sysconfdir="/etc" \
			--with-bootdir="/boot" \
			--with-grubdir="grub" \
			"${_conf[@]}" \
			CFLAGS="$_CFLAGS" LDFLAGS="$_LDFLAGS" CPPFLAGS="$_CPPFLAGS" \
			HOST_CFLAGS="$CFLAGS" HOST_LDFLAGS="$LDFLAGS" HOST_CPPFLAGS="$CPPFLAGS"		
	done
	
	if [[ "$_build_none" ]]; then
		msg2 "Configuring common items"
		cd "$srcdir"
		rm -rf "build-none"
		mkdir -p "build-none"
		
		cd "$srcdir/build-none"
		../grub/configure \
			--with-platform=none \
			--program-prefix='' \
			--prefix="/usr" \
			--bindir="/usr/bin" \
			--sbindir="/usr/bin" \
			--mandir="/usr/share/man" \
			--infodir="/usr/share/info" \
			--datarootdir="/usr/share" \
			--sysconfdir="/etc" \
			--with-bootdir="/boot" \
			--with-grubdir="grub" \
			"${_conf_none[@]}"
	fi
	
	for _item in "${pkgname[@]}"; do
		_item="${_item#grub2-}"
		_item="${_item%-git}"
		
		if [[ "$_item" = 'common' ]]; then
			msg2 "Building common items"
			cd "$srcdir/build-none"
			make
			continue
		elif [[ "$_item" = 'doc' ]]; then
			msg2 "Building documentation"
			cd "$srcdir/build-none/docs"
			make info
			make html
			continue
		fi
		
		_plat="${_item#*-}"
		_cpu="${_item%-*}"
		if [[ "$_cpu" = "$_plat" ]]; then
			_cpu=""
		fi
	
		msg2 "Building for $_item"
		cd "$srcdir/build-$_item"
		make ascii.h widthspec.h
		cd "$srcdir/build-$_item/grub-core"
		make -C gnulib
		make
	done
}

_package_plat() {
	depends+=("grub2-common-git=$pkgver")

	cd "$srcdir/build-$1/grub-core"
	. ./modinfo.sh
	_plat="${grub_modinfo_target_cpu}-${grub_modinfo_platform}"
	make install DESTDIR="$pkgdir"
	
	if check_option debug y; then
		_tostrip=(
			"$pkgdir/usr/lib/grub/$_plat"/*.module
			"$pkgdir/usr/lib/grub/$_plat"/*.image
		)
		
		for _f in "${_tostrip[@]}"; do
			if ! test -r "$_f"; then
				continue
			fi
			strip --only-keep-debug "$_f"
			chmod -x "$_f"
		done
		
		# the default behaviour of these options tends not to work very well here.
		options+=(!debug !strip)
	else
		rm -rf "$pkgdir/usr/lib/grub/$_plat"/*.module
		rm -rf "$pkgdir/usr/lib/grub/$_plat"/*.image
		rm -rf "$pkgdir/usr/lib/grub/$_plat"/gdb_grub
	fi
}

package_grub2-common-git() {
	pkgdesc="GNU GRand Unified Bootloader: common utilities (git snapshot)"
	conflicts=('grub-common')
	provides=('grub-common')
	optdepends=(
		'fuse: for grub-mount'
		'freetype2: for grub-mkfont'
		'os-prober: for detecting other OSes in grub-mkconfig'
		'efibootmgr: for grub-install EFI support'
	)
	backup=('etc/default/grub')

	cd "$srcdir/build-none"
	make install DESTDIR="$pkgdir"

	rm -rf "$pkgdir/usr/share/info"
}

package_grub2-doc-git() {
	pkgdesc="GNU GRand Unified Bootloader: documentation (git snapshot)"
	install=grub-doc.install
	arch=(any)

	cd "$srcdir/build-none/docs"
	make install-html DESTDIR="$pkgdir"
	make install-info DESTDIR="$pkgdir"
}

package_grub2-emu-git() {
	pkgdesc="GNU GRand Unified Bootloader: emulator (git snapshot)"
	provides=("grub2-emu")
	conflicts=('grub-emu' 'grub2-emu')
	depends=('sdl')

	_package_plat emu
}

package_grub2-x86_64-efi-git() {
	pkgdesc="GNU GRand Unified Bootloader: x86-64 EFI modules (git snapshot)"
	conflicts=('grub2-efi-x86_64')
	provides=("grub2-efi-x86_64" "grub2-modules" "grub2-modules-git=$pkgver")
	install=grub-notice.install

	_package_plat x86_64-efi
}

package_grub2-i386-pc-git() {
	pkgdesc="GNU GRand Unified Bootloader: i386 BIOS modules (git snapshot)"
	conflicts=('grub2-bios')
	provides=("grub2-bios" "grub2-modules" "grub2-modules-git=$pkgver")
	install=grub-notice.install

	_package_plat i386-pc
}

package_grub2-i386-qemu-git() {
	pkgdesc="GNU GRand Unified Bootloader: i386 QEMU ROM modules (git snapshot)"

	_package_plat i386-qemu
}

package_grub2-i386-efi-git() {
	pkgdesc="GNU GRand Unified Bootloader: i386 EFI modules (git snapshot)"
	conflicts=('grub2-efi-i386')
	provides=("grub2-efi-i386" "grub2-modules" "grub2-modules-git=$pkgver")
	install=grub-notice.install

	_package_plat i386-efi
}
