# Maintainer: Keshav Amburay <(the ddoott ridikulus ddoott rat) (aatt) (gemmaeiil) (ddoott) (ccoomm)>

_pkgname="efilinux"
pkgname="efilinux-git"

pkgver=1.1.3.g2b48286
pkgrel=1
pkgdesc="A simple UEFI Linux bootloader using EFI Handover Protocol"
url="https://github.com/mfleming/efilinux"
arch=('x86_64' 'i686')
license=('BSD')
makedepends=('git' 'gnu-efi-libs')
depends=('efibootmgr' 'dosfstools')
options=('!strip')
install="efilinux.install"

conflicts=('efilinux' 'efilinux-efi')
provides=("efilinux=${pkgver}" "efilinux-efi=${pkgver}")

source=("efilinux::git+https://github.com/mfleming/efilinux.git#branch=master")
sha1sums=('SKIP')

[[ "${CARCH}" == "x86_64" ]] && _EFI_ARCH="x86_64"
[[ "${CARCH}" == "i686" ]] && _EFI_ARCH="ia32"

[[ "${CARCH}" == "x86_64" ]] && _EFI_S_ARCH="x64"
[[ "${CARCH}" == "i686" ]] && _EFI_S_ARCH="ia32"

pkgver() {
	cd "${srcdir}/efilinux/"
	git describe --tags | sed -e 's|^efilinux-||g' -e 's|-|.|g'
}

_prepare_x64() {
	
	rm -rf "${srcdir}/efilinux-${pkgver}-x64/" || true
	cp -r "${srcdir}/efilinux" "${srcdir}/efilinux-${pkgver}-x64"
	
	cd "${srcdir}/efilinux-${pkgver}-x64/"
	
	msg "Add -m64 for X64 build"
	sed 's| -mno-red-zone| -m64 -mno-red-zone|g' -i "${srcdir}/efilinux-${pkgver}-x64/Makefile"
	
	msg "Add -fno-strict-aliasing -fno-stack-protector -fno-stack-check -mno-sse -mno-mmx to CFLAGS"
	sed 's|-DEFI_FUNCTION_WRAPPER |-DEFI_FUNCTION_WRAPPER -fno-strict-aliasing -fno-stack-protector -fno-stack-check -mno-sse -mno-mmx |g' -i "${srcdir}/efilinux-${pkgver}-x64/Makefile"
	
	msg "Add -DGNU_EFI_USE_MS_ABI -mabi=ms -maccumulate-outgoing-args to CFLAGS"
	sed 's|-DEFI_FUNCTION_WRAPPER |-DEFI_FUNCTION_WRAPPER -DGNU_EFI_USE_MS_ABI -mabi=ms -maccumulate-outgoing-args |g' -i "${srcdir}/efilinux-${pkgver}-x64/Makefile"
	
}

_prepare_ia32() {
	
	rm -rf "${srcdir}/efilinux-${pkgver}-ia32/" || true
	cp -r "${srcdir}/efilinux" "${srcdir}/efilinux-${pkgver}-ia32"
	
	cd "${srcdir}/efilinux-${pkgver}-ia32/"
	
	msg "Add -fno-strict-aliasing -fno-stack-protector -fno-stack-check -mno-sse -mno-mmx to CFLAGS"
	sed 's|-DEFI_FUNCTION_WRAPPER |-DEFI_FUNCTION_WRAPPER -fno-strict-aliasing -fno-stack-protector -fno-stack-check -mno-sse -mno-mmx |g' -i "${srcdir}/efilinux-${pkgver}-ia32/Makefile"
	
	msg "Add -DGNU_EFI_USE_MS_ABI -mabi=ms -maccumulate-outgoing-args to CFLAGS"
	sed 's|-DEFI_FUNCTION_WRAPPER |-DEFI_FUNCTION_WRAPPER -DGNU_EFI_USE_MS_ABI -mabi=ms -maccumulate-outgoing-args |g' -i "${srcdir}/efilinux-${pkgver}-ia32/Makefile"
	
}

prepare() {
	
	_prepare_x64
	
	# _prepare_ia32
	
}

_build_x64() {
	
	cd "${srcdir}/efilinux-${pkgver}-x64/"
	
	msg "Unset all compiler FLAGS"
	unset CFLAGS
	unset CPPFLAGS
	unset CXXFLAGS
	unset LDFLAGS
	unset MAKEFLAGS
	
	msg "Run make for X64"
	make CRT0="/usr/lib/crt0-efi-${_EFI_ARCH}.o" LDSCRIPT="/usr/lib/elf_${_EFI_ARCH}_efi.lds"
	
}

_build_ia32() {
	
	cd "${srcdir}/efilinux-${pkgver}-ia32"
	
	msg "Unset all compiler FLAGS"
	unset CFLAGS
	unset CPPFLAGS
	unset CXXFLAGS
	unset LDFLAGS
	unset MAKEFLAGS
	
	if [[ "${CARCH}" == "x86_64" ]]; then
		_LIBDIR="/usr/lib32/"
	else
		_LIBDIR="/usr/lib/"
	fi
	
	msg "Run make for IA32"
	make CRT0="${_LIBDIR}/crt0-efi-${_EFI_ARCH}.o" LDSCRIPT="${_LIBDIR}/elf_${_EFI_ARCH}_efi.lds"
	
}

build() {
	
	_build_x64
	
	# _build_ia32
	
}

package() {
	
	install -d "${pkgdir}/usr/lib/efilinux/"
	
	cd "${srcdir}/efilinux-${pkgver}-x64/"
	install -D -m0644 "${srcdir}/efilinux-${pkgver}-x64/efilinux.efi" "${pkgdir}/usr/lib/efilinux/efilinuxx64.efi"
	
	# cd "${srcdir}/efilinux-${pkgver}-ia32/"
	# install -D -m0644 "${srcdir}/efilinux-${pkgver}-ia32/efilinux.efi" "${pkgdir}/usr/lib/efilinux/efilinuxia32.efi"
	
}
