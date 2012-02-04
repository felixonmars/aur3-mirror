# Maintainer : Keshav P R <(the.ridikulus.rat) (aatt) (gemmaeiil) (ddoott) (ccoomm)>

_pkgname="fsresize"
pkgname="${_pkgname}-git"

pkgver=20111216
pkgrel=1
pkgdesc="FAT/HFS filesystem resize tool - GIT Version"
arch=('i686' 'x86_64')
license=('GPL3')
url="https://git.kernel.org/?p=linux/kernel/git/hch/fsresize.git;a=summary"
depends=('util-linux')
makedepends=('util-linux')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
# install="${_pkgname}.install"

source=()
sha256sums=()

_gitroot="git://git.kernel.org/pub/scm/linux/kernel/git/hch/${_pkgname}.git"
_gitname="${_pkgname}"

_update_git() {
	
	cd "${srcdir}"
	
	msg "Connecting to GIT server...."
	
	if [ -d "${srcdir}/${_gitname}/" ]
	then
		cd "${srcdir}/${_gitname}/"
		git reset --hard
		git fetch
		git checkout master
		git merge remotes/origin/master
		msg "The local GIT repo has been updated."
	else
		git clone "${_gitroot}" "${_gitname}"
		msg "GIT checkout done or server timeout"
	fi
	
	echo
	
}

build() {
	
	_update_git
	
	rm -rf "${srcdir}/${_gitname}_build" || true
	cp -r "${srcdir}/${_gitname}" "${srcdir}/${_gitname}_build"
	
	cd "${srcdir}/${_gitname}_build/libparted"
	
	CFLAGS="" make
	echo
	
	cd "${srcdir}/${_gitname}_build/cmd"
	
	CFLAGS="" make
	echo
	
}

package() {
	
	cd "${srcdir}/${_gitname}_build"
	
	install -d "${pkgdir}/usr/bin"
	install -D -m0755 "${srcdir}/${_gitname}_build/cmd/fsresize" "${pkgdir}/usr/bin/fsresize"
	
}
