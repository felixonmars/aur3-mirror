# Maintainer: Keshav P R <skodabenz aatt rocketmail ccoomm>

_pkgname="elilo"
pkgname="${_pkgname}-git"

pkgver=20110811
pkgrel=1
pkgdesc="EFI LInux Boot LOader - compiled from GIT mirror of CVS repo"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/${_pkgname}/"
license=('GPL')
makedepends=('git' 'gnu-efi')
depends=('dosfstools' 'efibootmgr')
provides=("${_pkgname}" "${_pkgname}-cvs")
conflicts=("${_pkgname}" "${_pkgname}-cvs")
options=(strip docs zipman purge !libtool !emptydirs)
install="${pkgname}.install"
backup=("boot/efi/efi/${_pkgname}/${_pkgname}.conf")

source=("${_pkgname}.conf.example")
sha256sums=('beab92368eec32b29f11f2cee9a36581c7b630c4e1cfae2e4ad0c92906b16ca3')

_gitroot="git://github.com/skodabenz/${_pkgname}_cvs_to_git_temp.git"
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
	
	rm -rf "${srcdir}/${_gitname}_build/" || true
	cp -r "${srcdir}/${_gitname}" "${srcdir}/${_gitname}_build"
	
	cd "${srcdir}/${_gitname}_build"
	
	# sed -i 's|CONFIG_ext2fs=n|CONFIG_ext2fs=y|g' "${srcdir}/${_gitname}_build/Make.defaults" || true
	# sed -i 's|DEBUGFLAGS = -Wall|DEBUGFLAGS = |g' "${srcdir}/${_gitname}_build/Make.defaults" || true
	
	CFLAGS="" make
	echo
	
}


package() {
	
	cd "${srcdir}/${_gitname}_build"
	
	install -d "${pkgdir}/boot/efi/efi/${_pkgname}/"
	install -D -m644 "${srcdir}/${_gitname}_build/${_pkgname}.efi" "${pkgdir}/boot/efi/efi/${_pkgname}/${_pkgname}.efi"
	install -D -m644 "${srcdir}/${_pkgname}.conf.example" "${pkgdir}/boot/efi/efi/${_pkgname}/${_pkgname}.conf"
	
	install -d "${pkgdir}/usr/sbin/"
	install -D -m755 "${srcdir}/${_gitname}_build/tools/${_pkgname}alt" "${pkgdir}/usr/sbin/${_pkgname}alt"
	
}
