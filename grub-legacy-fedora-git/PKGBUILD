# Maintainer : Keshav P R <(the.ridikulus.rat) (aatt) (gemmaeiil) (ddoott) (ccoomm)>

# This PKGBUILD is based on grub.spec at https://pkgs.fedoraproject.org/gitweb/?p=grub.git;a=blob_plain;f=grub.spec;hb=HEAD .

# This grub-legacy package includes support for booting from GPT and for reading EXT4 filesystem (/boot can be ext4).

_actualname="grub-legacy"
_pkgname="${_actualname}-fedora"
pkgname="${_pkgname}-git"

pkgver=20120109
pkgrel=1
pkgdesc="Fedora's grub-legacy fork - compiled for BIOS systems"
url="https://git.kernel.org/?p=boot/grub-fedora/grub-fedora.git"
arch=('i686' 'x86_64')
license=('GPL')
makedepends=('git' 'ncurses')
depends=('ncurses')
optdepends=('python2: For /sbin/grub-crypt python2 script')
backup=('boot/grub/grub.conf')
conflicts=('grub' "${_actualname}")
provides=('grub' "${_actualname}")
options=(strip !emptydirs zipman !libtool docs !buildflags !makeflags)

source=('grub.conf')
sha256sums=('f2d7bea7b2f3e54ca96e1637ae88f73a0f409a04563038d36d25190169339898')

install="${pkgname}.install"

## TODO: Need to check whether multilib is really needed for x86_64.
if [[ "${CARCH}" == 'x86_64' ]]; then
	makedepends+=('gcc-multilib' 'gcc-libs-multilib' 'lib32-glibc' 'binutils-multilib' 'libtool-multilib')
	echo
fi

_gitroot="git://github.com/vathpela/grub-fedora.git"

_gitname="grub-legacy-fedora"
_gitbranch="master"
# _gitbranch="fedora-16"

_update_git() {
	
	cd "${srcdir}/"
	
	msg "Connecting to GIT server...."
	
	if [[ -d "${srcdir}/${_gitname}/" ]]; then
		cd "${srcdir}/${_gitname}/"
		git reset --hard
		
		git remote rm origin
		git remote add origin "${_gitroot}"
		
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
	
	_update_git
	
	rm -rf "${srcdir}/${_gitname}_build/" || true
	cp -r "${srcdir}/${_gitname}" "${srcdir}/${_gitname}_build"
	
	cd "${srcdir}/${_gitname}_build/"
	
	sed "s|0\.97|0\.97-${pkgver}|" -i "${srcdir}/${_gitname}_build/configure.in" || true
	# sed "s|0\.97|0\.97-${pkgver}|" -i "${srcdir}/${_gitname}_build/configure.ac" || true
	echo
	
	unset CFLAGS
	unset CXXFLAGS
	
	autoreconf
	echo
	autoconf
	echo
	
	__CFLAGS="-Os -g -fno-strict-aliasing -fno-stack-protector -Wall -Wno-error -Wno-shadow -Wno-unused -Wno-pointer-sign -m32"
	
	if [[ "${CARCH}" == 'x86_64' ]]; then
		_CFLAGS="${__CFLAGS} -static"
	else
		_CFLAGS="${__CFLAGS}"
	fi
	
	CFLAGS="${_CFLAGS}" ./configure \
		--with-platform="pc" \
		--host=i386-pc-linux-gnu \
		--disable-auto-linux-mem-opt \
		--without-curses \
		--prefix="/usr" \
		--bindir="/bin" \
		--sbindir="/sbin" \
		--mandir="/usr/share/man" \
		--infodir="/usr/share/info" \
		--libdir="/usr/lib" \
		--datarootdir="/usr/lib"
	echo
	
	CFLAGS="${_CFLAGS}" make
	echo
	
}


package() {
	
	cd "${srcdir}/${_gitname}_build/"
	
	make DESTDIR="${pkgdir}" install
	
	install -D -m0644 "${srcdir}/grub.conf" "${pkgdir}/boot/grub/grub.conf"
	
	sed 's|#! /usr/bin/python|#!/usr/bin/env python2|g' -i "${pkgdir}/sbin/grub-crypt"
	
}
