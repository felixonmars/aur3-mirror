# Maintainer : Keshav P R <(the.ridikulus.rat) (aatt) (gemmaeiil) (ddoott) (ccoomm)>

_pkgname="grub2-bios-bzr"

pkgname="${_pkgname}"
# pkgname="${_pkgname}-exp"    ## Uncomment for grub BZR Experimental Branch

pkgver="4343"
pkgdesc="The GNU GRand Unified Bootloader - Version 2 - Built for i386 BIOS - BZR Development version with grub-extras"
url="http://www.gnu.org/software/grub/"
arch=('i686' 'x86_64')
license=('GPL3')

makedepends=('bzr' 'rsync' 'xz' 'bdf-unifont' 'python' 'autogen' 'texinfo' 'help2man' 'gettext' 'device-mapper' 'fuse')
depends=('xz' 'freetype2' 'device-mapper' 'fuse' 'gettext' 'sh')
optdepends=('libisoburn: provides xorriso for generating grub rescue iso using grub-mkrescue'
            'os-prober: to detect other OSes when generating grub.cfg in BIOS systems')

install="${_pkgname}.install"
backup=('boot/grub/grub.cfg' 'etc/default/grub' 'etc/grub.d/40_custom')
conflicts=('grub2-common' 'grub2-bios')
provides=('grub2-common' 'grub2-bios')

source=('grub.default'
        'grub.cfg'
        '20_memtest86+'
        'archlinux_grub_mkconfig_fixes.patch')

sha256sums=('df764fbd876947dea973017f95371e53833bf878458140b09f0b70d900235676'
            'fcace8f0f0b4b8dc013c85296d59663f9f6695c49e92c1cb492b7a0f84164070'
            '259d7eafa2751dd443cb3a08784ef444565cc487d427afa9a268e41bb6c5aba2'
            '9f570f72475076c54ee1c1b0e0646edd2a712846c519dfb17a4d8bcb3489ceba')


case "${pkgname}" in
	grub2-bios-bzr-exp )
		pkgdesc="The GNU GRand Unified Bootloader 2 - Built for i386 BIOS - BZR Experimental Branch with grub-extras"
		pkgrel="1"
		conflicts+=("${_pkgname}")
		_bzrtrunk="bzr://bzr.savannah.gnu.org/grub/branches/experimental/"
		# _bzrtrunk="lp:~the-ridikulus-rat/grub/grub2-bzr-exp"
		_bzrmod="grub_exp"
	;;
	grub2-bios-bzr )
		pkgdesc="The GNU GRand Unified Bootloader 2 - Built for i386 BIOS - BZR Main Trunk with grub-extras"
		pkgrel="1"
		conflicts+=("${_pkgname}-exp")
		_bzrtrunk="bzr://bzr.savannah.gnu.org/grub/trunk/grub/"
		# _bzrtrunk="lp:grub/grub2"
		_bzrmod="grub"
	;;
esac

if [[ "${CARCH}" == 'x86_64' ]]; then
	# makedepends+=('gcc-multilib' 'gcc-libs-multilib' 'lib32-glibc' 'binutils-multilib' 'libtool-multilib')
	
	_EFIEMU="--enable-efiemu"
else
	_EFIEMU="--disable-efiemu"
fi


## grub-extras bzr repo locations

_bzrtrunk_lua="bzr://bzr.savannah.gnu.org/grub-extras/lua/"
# _bzrtrunk_lua="lp:~the-ridikulus-rat/grub/grub2-extras-lua"

_bzrtrunk_ntldr_img="bzr://bzr.savannah.gnu.org/grub-extras/ntldr-img/"
# _bzrtrunk_ntldr_img="lp:~the-ridikulus-rat/grub/grub2-extras-ntldr-img"

_bzrtrunk_915resolution="bzr://bzr.savannah.gnu.org/grub-extras/915resolution/"
# _bzrtrunk_915resolution="lp:~the-ridikulus-rat/grub/grub2-extras-915resolution"

_bzrtrunk_gpxe="bzr://bzr.savannah.gnu.org/grub-extras/gpxe/"
# _bzrtrunk_gpxe="lp:~the-ridikulus-rat/grub/grub2-extras-gpxe"


_update_bzr() {
	
	msg "Connecting to BZR server..."
	
	if [[ -d "${srcdir}/${_bzrmod}" ]]; then
		cd "${srcdir}/${_bzrmod}"
		bzr pull "${_bzrtrunk}"
		msg "GRUB BZR Local repository updated."
	else
		cd "${srcdir}/"
		bzr branch "${_bzrtrunk}" "${_bzrmod}"
		msg "GRUB BZR repository cloned."
	fi
	msg "BZR checkout done or server timeout"
	
	if [[ -d "${srcdir}/${_bzrmod}/grub-extras" ]]; then
		cd "${srcdir}/${_bzrmod}/grub-extras/"
		
		if [[ -d "${srcdir}/${_bzrmod}/grub-extras/lua" ]]; then
			cd "${srcdir}/${_bzrmod}/grub-extras/lua"
			bzr pull "${_bzrtrunk_lua}"
			echo
		else
			bzr branch "${_bzrtrunk_lua}" lua
			echo
		fi
		
		if [[ -d "${srcdir}/${_bzrmod}/grub-extras/ntldr-img" ]]; then
			cd "${srcdir}/${_bzrmod}/grub-extras/ntldr-img"
			bzr pull "${_bzrtrunk_ntldr_img}"
			echo
		else
			bzr branch "${_bzrtrunk_ntldr_img}" ntldr-img
			echo
		fi
		
		if [[ -d "${srcdir}/${_bzrmod}/grub-extras/915resolution" ]]; then
			cd "${srcdir}/${_bzrmod}/grub-extras/915resolution"
			bzr pull "${_bzrtrunk_915resolution}"
			echo
		else
			bzr branch "${_bzrtrunk_915resolution}" 915resolution
			echo
		fi
		
		if [[ -d "${srcdir}/${_bzrmod}/grub-extras/gpxe" ]]; then
			cd "${srcdir}/${_bzrmod}/grub-extras/gpxe"
			bzr pull "${_bzrtrunk_gpxe}"
			echo
		else
			bzr branch "${_bzrtrunk_gpxe}" gpxe
			echo
		fi
	else
		mkdir -p "${srcdir}/${_bzrmod}/grub-extras/"
		cd "${srcdir}/${_bzrmod}/grub-extras/"
		
		bzr branch "${_bzrtrunk_lua}" lua
		echo
		bzr branch "${_bzrtrunk_ntldr_img}" ntldr-img
		echo
		bzr branch "${_bzrtrunk_915resolution}" 915resolution
		echo
		bzr branch "${_bzrtrunk_gpxe}" gpxe
		echo
	fi
	
	cd "${srcdir}/${_bzrmod}/"
	rsync -Lrtvz translationproject.org::tp/latest/grub/ "${srcdir}/${_bzrmod}/po" || true
	(cd "${srcdir}/${_bzrmod}/po" && ls *.po | cut -d. -f1 | xargs) > "${srcdir}/${_bzrmod}/po/LINGUAS"
	
}


build() {
	
	_update_bzr
	
	rm -rf "${srcdir}/${_bzrmod}_build" || true
	
	rm -rf "${srcdir}/${_bzrmod}/grub-extras/zfs" || true
	
	cp -r "${srcdir}/${_bzrmod}" "${srcdir}/${_bzrmod}_build"
	cd "${srcdir}/${_bzrmod}_build"
	
	## Apply Archlinux specific fixes to enable grub-mkconfig detect Arch kernels and initramfs
	patch -Np1 -i "${srcdir}/archlinux_grub_mkconfig_fixes.patch"
	echo
	
	export GRUB_CONTRIB="${srcdir}/${_bzrmod}_build/grub-extras/"
	
	## Requires python2
	install -D -m0755 "${srcdir}/${_bzrmod}_build/autogen.sh" "${srcdir}/${_bzrmod}_build/autogen_unmodified.sh"
	# sed 's|python |python2 |g' -i "${srcdir}/${_bzrmod}_build/autogen.sh"
	echo
	
	"${srcdir}/${_bzrmod}_build/autogen.sh"
	echo
	
	## fix unifont.bdf location so grub-mkfont can create *.pf2 files
	sed 's|/usr/share/fonts/unifont|/usr/share/fonts/misc|g' -i "${srcdir}/${_bzrmod}_build/configure"
	
	mkdir -p "${srcdir}/${_bzrmod}_build/BUILD_BIOS"
	cd "${srcdir}/${_bzrmod}_build/BUILD_BIOS"
	
	CFLAGS="" ../configure \
		--with-platform="pc" \
		--target="i386" \
		--host="${CARCH}-unknown-linux-gnu" \
		"${_EFIEMU}" \
		--enable-mm-debug \
		--enable-nls \
		--enable-device-mapper \
		--enable-cache-stats \
		--enable-grub-mkfont \
		--enable-grub-mount \
		--prefix="/usr" \
		--bindir="/usr/bin" \
		--sbindir="/usr/sbin" \
		--mandir="/usr/share/man" \
		--infodir="/usr/share/info" \
		--datarootdir="/usr/share" \
		--sysconfdir="/etc" \
		--program-prefix="" \
		--with-bootdir="/boot" \
		--with-grubdir="grub" \
		--disable-werror
	echo
	
	CFLAGS="" make
	echo
	
}

package() {
	
	cd "${srcdir}/${_bzrmod}_build/BUILD_BIOS"
	make DESTDIR="${pkgdir}/" bashcompletiondir="/usr/share/bash-completion/completions/" install
	echo
	
	## install /etc/default/grub
	install -D -m0644 "${srcdir}/grub.default" "${pkgdir}/etc/default/grub"
	
	## install grub.cfg for /boot/grub/grub.cfg backup
	install -D -m0644 "${srcdir}/grub.cfg" "${pkgdir}/boot/grub/grub.cfg"
	
	## install memtest config detection
	install -D -m0755 "${srcdir}/20_memtest86+" "${pkgdir}/etc/grub.d/20_memtest86+"
	
}
