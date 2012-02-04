# Mantainer: Luca Cesari <mirshann@freakmind.org>

pkgname=peater-git
pkgver=20110904
pkgrel=1
pkgdesc="Bash script for save and restore packages on Archlinux"
url='https://github.com/mirshann/peater'
arch=('any')
license=('MIT')
makedepends=("git" "bash" "packer")
provides=('peater')

_gitroot="git://github.com/mirshann/peater.git"
_gitname="peater"

build() {
	cd ${srcdir}
	msg "Connecting to git server..."

	if [ -d ${srcdir}/${_gitname} ]; then
		cd ${_gitname} && git pull origin
		msg "The local files are updated."
	else
		git clone ${_gitroot} --depth=1 ${_gitname}
	fi

	msg "GIT checkout done or server timeout"
	
	# license
	install -Dm644 "${srcdir}/${_gitname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	
	# readme & script
	install -Dm644 "${srcdir}/${_gitname}/README.md" "${pkgdir}/usr/share/doc/${_gitname}/README"
	install -Dm755 "${srcdir}/${_gitname}/peater" "${pkgdir}/usr/bin/peater"
}
