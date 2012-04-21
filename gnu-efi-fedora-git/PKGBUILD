# Maintainer : Keshav P R <(the.ridikulus.rat) (aatt) (gemmaeiil) (ddoott) (ccoomm)>

_actualname="gnu-efi"
_pkgname="${_actualname}-fedora"
pkgname="${_pkgname}-git"

pkgver=20120421
pkgrel=1
pkgdesc="Library for building UEFI Applications using GNU toolchain - Fedora's fork"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/gnu-efi/"
license=('GPL')
makedepends=('git')
depends=('pciutils')
provides=("${_actualname}" "${_pkgname}")
conflicts=("${_actualname}" "${_pkgname}")
options=(!strip docs zipman purge !libtool emptydirs)
# install="${_pkgname}.install"
backup=()

source=()

_gitroot="git://github.com/vathpela/gnu-efi.git"
_gitname="${_pkgname}"
_gitbranch="fedora"

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
	
	cd "${srcdir}/${_gitname}_build"
	
	CFLAGS="" make -j1
	echo
	
}

package() {
	
	cd "${srcdir}/${_gitname}_build"
	
	make INSTALLROOT="${pkgdir}" PREFIX="/usr" install
	echo
	
}
