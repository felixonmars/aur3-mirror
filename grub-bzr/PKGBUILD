# Maintainer : Zack Buhman
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Ronald van Haren <ronald.archlinux.org>
# Contributor: Keshav Padram Amburay <(the.ridikulus.rat) (aatt) (gemmaeiil) (ddoott) (ccoomm)>

## "1" to enable, "0" to disable
_GRUB_EMU_BUILD="1"

[[ "${CARCH}" == "x86_64" ]] && _EFI_ARCH="x86_64"
[[ "${CARCH}" == "i686" ]] && _EFI_ARCH="i386"

_pkgname="grub"
_pkgver="2.00"

pkgname="${_pkgname}-bzr"
pkgdesc="GNU GRand Unified Bootloader (2) - BZR Version"
pkgver="5088"
pkgrel="1"
url="https://www.gnu.org/software/grub/"
arch=('x86_64' 'i686')
license=('GPL3')
backup=('boot/grub/grub.cfg' 'etc/default/grub' 'etc/grub.d/40_custom')
install="${_pkgname}.install"
options=('!makeflags')

conflicts=('grub-common' 'grub-bios' "grub-efi-${_EFI_ARCH}" 'grub-emu' 'grub-legacy')
provides=('grub' 'grub-common' 'grub-bios' "grub-efi-${_EFI_ARCH}" 'grub-emu')

makedepends=('xz' 'freetype2' 'bdf-unifont' 'ttf-dejavu' 'python' 'autogen'
             'texinfo' 'help2man' 'gettext' 'device-mapper' 'fuse' 'bzr')
depends=('sh' 'xz' 'gettext' 'device-mapper')
optdepends=('freetype2: For grub-mkfont usage'
            'fuse: For grub-mount usage'
            'dosfstools: For grub-mkrescue FAT FS and EFI support' 
            'efibootmgr: For grub-install EFI support'
            'libisoburn: Provides xorriso for generating grub rescue iso using grub-mkrescue'
            'os-prober: To detect other OSes when generating grub.cfg in BIOS systems'
            'mtools: For grub-mkrescue FAT FS support')

if [[ "${_GRUB_EMU_BUILD}" == "1" ]]; then
    makedepends+=('libusbx' 'sdl')
    optdepends+=('libusbx: For grub-emu USB support'
                 'sdl: For grub-emu SDL support')
fi

source=("grub-${_pkgver}::bzr+bzr://bzr.savannah.gnu.org/grub/trunk/grub/#revision="
        'archlinux_grub_mkconfig_fixes.patch'
        '60_memtest86+'
        'grub.default'
        'grub.cfg')

for _DIR_ in 915resolution ntldr-img ; do
    source+=("grub-extras-${_DIR_}::bzr+bzr://bzr.savannah.gnu.org/grub-extras/${_DIR_}/#revision=")
done

sha1sums=('SKIP'
          'e7fd9161057411b1adc22977d4b3e7c06116239d'
          '2aa2deeb7d7dc56f389aa1487b7a57b0d44ce559'
          'dbf493dec4722feb11f0b5c71ad453a18daf0fc5'
          '5b7fcb0718a23035c039eb2fda9e088bb13ae611'
          'SKIP'
          'SKIP')

pkgver() {
	cd "${srcdir}/grub-${_pkgver}/"
	bzr revno
}

prepare() {
	
	cd "${srcdir}/grub-${_pkgver}/"
	
	msg "Apply Archlinux specific fixes to enable grub-mkconfig detect Arch kernels and initramfs"
	patch -Np1 -i "${srcdir}/archlinux_grub_mkconfig_fixes.patch"
	echo
	
	msg "Fix DejaVuSans.ttf location so that grub-mkfont can create *.pf2 files for starfield theme"
	sed 's|/usr/share/fonts/dejavu|/usr/share/fonts/dejavu /usr/share/fonts/TTF|g' -i "${srcdir}/grub-${_pkgver}/configure.ac"
	
	# msg "Requires python2"
	# sed 's|python |python2 |g' -i "${srcdir}/grub-${_pkgver}/autogen.sh"
	
	msg "Pull in latest language files"
	./linguas.sh
	echo
	
	msg "Remove not working langs which need LC_ALL=C.UTF-8"
	sed -e 's#en@cyrillic en@greek##g' -i "${srcdir}/grub-${_pkgver}/po/LINGUAS"
	
}

_build_grub-common_and_bios() {
	
	msg "Set ARCH dependent variables for bios build"
	if [[ "${CARCH}" == 'x86_64' ]]; then
		_EFIEMU="--enable-efiemu"
	else
		_EFIEMU="--disable-efiemu"
	fi
	
	msg "Copy the source for building the bios package"
	cp -r "${srcdir}/grub-${_pkgver}" "${srcdir}/grub-${_pkgver}-bios"
	cd "${srcdir}/grub-${_pkgver}-bios/"
	
	msg "Add the grub-extra sources for bios build"
	install -d "${srcdir}/grub-${_pkgver}-bios/grub-extras"
	for _DIR_ in 915resolution ntldr-img ; do
		cp -r "${srcdir}/grub-extras-${_DIR_}" "${srcdir}/grub-${_pkgver}-bios/grub-extras/${_DIR_}"
	done
	export GRUB_CONTRIB="${srcdir}/grub-${_pkgver}-bios/grub-extras/"
	
	msg "Unset all compiler FLAGS for bios build"
	unset CFLAGS
	unset CPPFLAGS
	unset CXXFLAGS
	unset LDFLAGS
	unset MAKEFLAGS
	
	cd "${srcdir}/grub-${_pkgver}-bios/"
	
	msg "Run autogen.sh for bios build"
	./autogen.sh
	echo
	
	msg "Run ./configure for bios build"
	./configure \
		--with-platform="pc" \
		--target="i386" \
		"${_EFIEMU}" \
		--enable-mm-debug \
		--enable-nls \
		--enable-device-mapper \
		--enable-cache-stats \
		--enable-boot-time \
		--enable-grub-mkfont \
		--enable-grub-mount \
		--prefix="/usr" \
		--bindir="/usr/bin" \
		--sbindir="/usr/bin" \
		--mandir="/usr/share/man" \
		--infodir="/usr/share/info" \
		--datarootdir="/usr/share" \
		--sysconfdir="/etc" \
	 	--program-prefix="" \
		--with-bootdir="/boot" \
		--with-grubdir="grub" \
		--disable-silent-rules \
		--disable-werror
	echo
	
	msg "Run make for bios build"
	make
	echo
}

_build_grub-efi() {
	
	msg "Copy the source for building the efi package"
	cp -r "${srcdir}/grub-${_pkgver}" "${srcdir}/grub-${_pkgver}-efi"
	cd "${srcdir}/grub-${_pkgver}-efi/"
	
	# msg "Add the grub-extra sources for efi build"
	# install -d "${srcdir}/grub-${_pkgver}-efi/grub-extras/"
	# for _DIR_ in lua gpxe ; do
	#	cp -r "${srcdir}/grub-extras-${_DIR_}" "${srcdir}/grub-${_pkgver}-bios/grub-extras/${_DIR_}"
	# done
	# export GRUB_CONTRIB="${srcdir}/grub-${_pkgver}-efi/grub-extras/"
	
	msg "Unset all compiler FLAGS for efi build"
	unset CFLAGS
	unset CPPFLAGS
	unset CXXFLAGS
	unset LDFLAGS
	unset MAKEFLAGS
	
	cd "${srcdir}/grub-${_pkgver}-efi/"
	
	msg "Run autogen.sh for efi build"
	./autogen.sh
	echo
	
	msg "Run ./configure for efi build"
	./configure \
		--with-platform="efi" \
		--target="${_EFI_ARCH}" \
		--disable-efiemu \
		--enable-mm-debug \
		--enable-nls \
		--enable-device-mapper \
		--enable-cache-stats \
		--enable-boot-time \
		--enable-grub-mkfont \
		--enable-grub-mount \
		--prefix="/usr" \
		--bindir="/usr/bin" \
		--sbindir="/usr/bin" \
		--mandir="/usr/share/man" \
		--infodir="/usr/share/info" \
		--datarootdir="/usr/share" \
		--sysconfdir="/etc" \
		--program-prefix="" \
		--with-bootdir="/boot" \
		--with-grubdir="grub" \
		--disable-silent-rules \
		--disable-werror
	echo
	
	msg "Run make for efi build"
	make
	echo
	
}

_build_grub-emu() {
	
	msg "Set ARCH dependent variables for emu build"
	if [[ "${CARCH}" == 'x86_64' ]]; then
		_EFIEMU="--disable-efiemu"
	else
		_EFIEMU="--enable-efiemu"
	fi
	
	msg "Copy the source for building the emu package"
	cp -r "${srcdir}/grub-${_pkgver}" "${srcdir}/grub-${_pkgver}-emu"
	cd "${srcdir}/grub-${_pkgver}-emu/"
	
	msg "Unset all compiler FLAGS for emu build"
	unset CFLAGS
	unset CPPFLAGS
	unset CXXFLAGS
	unset LDFLAGS
	unset MAKEFLAGS
	
	cd "${srcdir}/grub-${_pkgver}-emu/"
	
	msg "Run autogen.sh for emu build"
	./autogen.sh
	echo
	
	msg "Run ./configure for emu build"
	./configure \
		--with-platform="emu" \
		--target="${_EFI_ARCH}" \
		"${_EFIEMU}" \
		--enable-mm-debug \
		--enable-nls \
		--enable-device-mapper \
		--enable-cache-stats \
		--enable-grub-mkfont \
		--enable-grub-mount \
		--enable-grub-emu-usb=no \
		--enable-grub-emu-sdl=no \
		--disable-grub-emu-pci \
		--prefix="/usr" \
		--bindir="/usr/bin" \
		--sbindir="/usr/bin" \
		--mandir="/usr/share/man" \
		--infodir="/usr/share/info" \
		--datarootdir="/usr/share" \
		--sysconfdir="/etc" \
		--program-prefix="" \
		--with-bootdir="/boot" \
		--with-grubdir="grub" \
		--disable-silent-rules \
		--disable-werror
	echo
	
	msg "Run make for emu build"
	make
	echo
	
}

build() {
	
	cd "${srcdir}/grub-${_pkgver}/"
	
	msg "Build grub bios stuff"
	_build_grub-common_and_bios
	echo
	
	msg "Build grub efi stuff"
	_build_grub-efi
	echo
	
	if [[ "${_GRUB_EMU_BUILD}" == "1" ]]; then
		msg "Build grub emu stuff"
		_build_grub-emu
		echo
	fi
	
}

_package_grub-common_and_bios() {
	
	cd "${srcdir}/grub-${_pkgver}-bios/"
	
	msg "Run make install for bios build"
	make DESTDIR="${pkgdir}/" bashcompletiondir="/usr/share/bash-completion/completions" install
	echo
	
	msg "Remove gdb debugging related files for bios build"
	rm -f "${pkgdir}/usr/lib/grub/i386-pc"/*.module || true
	rm -f "${pkgdir}/usr/lib/grub/i386-pc"/*.image || true
	rm -f "${pkgdir}/usr/lib/grub/i386-pc"/{kernel.exec,gdb_grub,gmodule.pl} || true
	
	msg "Fix OS naming FS#33393"
	sed 's|GNU/Linux|Linux|g' -i "${pkgdir}/etc/grub.d/10_linux"
	
	msg "Fix rw FS#36275"
	sed 's| ro | rw |g' -i "${pkgdir}/etc/grub.d/10_linux"
	
	msg "Install extra /etc/grub.d/ files"
	install -D -m0755 "${srcdir}/60_memtest86+" "${pkgdir}/etc/grub.d/60_memtest86+"
	
	msg "Install /etc/default/grub (used by grub-mkconfig)"
	install -D -m0644 "${srcdir}/grub.default" "${pkgdir}/etc/default/grub"
	
	msg "Install grub.cfg for backup array"
	install -D -m0644 "${srcdir}/grub.cfg" "${pkgdir}/boot/grub/grub.cfg"
	
}

_package_grub-efi() {
	
	cd "${srcdir}/grub-${_pkgver}-efi/"
	
	msg "Run make install for efi build"
	make DESTDIR="${pkgdir}/" bashcompletiondir="/usr/share/bash-completion/completions" install
	echo
	
	msg "Remove gdb debugging related files for efi build"
	rm -f "${pkgdir}/usr/lib/grub/${_EFI_ARCH}-efi"/*.module || true
	rm -f "${pkgdir}/usr/lib/grub/${_EFI_ARCH}-efi"/*.image || true
	rm -f "${pkgdir}/usr/lib/grub/${_EFI_ARCH}-efi"/{kernel.exec,gdb_grub,gmodule.pl} || true
	
}

_package_grub-emu() {
	
	cd "${srcdir}/grub-${_pkgver}-emu/"
	
	msg "Run make install for emu build"
	make DESTDIR="${pkgdir}/" bashcompletiondir="/usr/share/bash-completion/completions" install
	echo
	
	msg "Remove gdb debugging related files for emu build"
	rm -f "${pkgdir}/usr/lib/grub/${_EFI_ARCH}-emu"/*.module || true
	rm -f "${pkgdir}/usr/lib/grub/${_EFI_ARCH}-emu"/*.image || true
	rm -f "${pkgdir}/usr/lib/grub/${_EFI_ARCH}-emu"/{kernel.exec,gdb_grub,gmodule.pl} || true
	
}

package() {
	
	cd "${srcdir}/grub-${_pkgver}/"
	
	if [[ "${_GRUB_EMU_BUILD}" == "1" ]]; then
		msg "Package grub emu stuff"
		_package_grub-emu
		echo
	fi
	
	msg "Package grub efi stuff"
	_package_grub-efi
	echo
	
	msg "Package grub bios stuff"
	_package_grub-common_and_bios
	echo
	
}
