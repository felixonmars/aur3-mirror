# Maintainer : Keshav P R <(the.ridikulus.rat) (aatt) (gemmaeiil) (ddoott) (ccoomm)>

_GNU_EFI_LIB_DIR="/usr/lib"

_actualname="efilinux"
_pkgname="${_actualname}-x86_64"
pkgname="${_pkgname}-git"

pkgver=20120429
pkgrel=1
pkgdesc="Reference Implementation of a Linux Bootloader for x86_64 UEFI Firmwares"
arch=('any')
url="https://github.com/mfleming/efilinux"
license=('GPL')

makedepends=('git' 'gnu-efi')
depends=('dosfstools' 'efibootmgr')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

options=('!strip' 'purge' '!libtool' 'emptydirs')
install="${_actualname}.install"

_gitroot="git://github.com/mfleming/efilinux.git"
_gitname="${_actualname}"
_gitbranch="next"

_update_git() {
	
	cd "${srcdir}/"
	
	msg "Connecting to GIT server...."
	
	if [[ -d "${srcdir}/${_gitname}/" ]]; then
		cd "${srcdir}/${_gitname}/"
		git reset --hard
		git fetch
		git checkout "${_gitbranch}"
		git merge "remotes/origin/${_gitbranch}"
		msg "The local GIT repo has been updated."
	else
		git clone "${_gitroot}" "${_gitname}"
		cd "${srcdir}/${_gitname}/"
		git checkout "${_gitbranch}"
		msg "GIT checkout done or server timeout"
	fi
	
	echo
	
}

build() {
	
	if [[ "${CARCH}" != "x86_64" ]]; then
		echo "${pkgname} package can be built only in a x86_64 system. Exiting."
		exit 1
	else
		_update_git
		echo
	fi
	
	rm -rf "${srcdir}/${_gitname}_build/" || true
	cp -r "${srcdir}/${_gitname}" "${srcdir}/${_gitname}_build"
	
	cd "${srcdir}/${_gitname}_build"
	
	## Change LIBDIR from /usr/lib64/ to /usr/lib/ in Makefile
	sed 's|/usr/lib64|/usr/lib|g' -i "${srcdir}/${_gitname}_build/Makefile"
	
	make clean || true
	echo
	
	CFLAGS="" ARCH="x86_64" CRT0="${_GNU_EFI_LIB_DIR}/crt0-efi-x86_64.o" LDSCRIPT="${_GNU_EFI_LIB_DIR}/elf_x86_64_efi.lds" make
	echo
	
}

package() {
	
	cd "${srcdir}/${_gitname}_build"
	
	install -D -m0644 "${srcdir}/${_gitname}_build/efilinux.efi" "${pkgdir}/boot/efi/EFI/arch/efilinux/efilinuxx64.efi"
	
}
