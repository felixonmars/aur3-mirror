# Maintainer: Nicky726 <Nicky726 [at] gmail [dot] com>

pkgname=tv-dl-git
_origname=tv-dl
pkgver=20111228
pkgrel=1
pkgdesc="CLI aplication to download and play some Czech television streams"
arch=('any')
url="https://github.com/Limoto/tv-dl"
license=('GPL')
depends=('python>=3.2' 'rtmpdump')
makedepends=('sed')
_gitroot=git://github.com/Limoto/tv-dl.git
_gitname=tv-dl
source=()
md5sums=()

build() {
	cd "${srcdir}"
	if [ -d "${srcdir}/${_gitname}" ] ; then
		cd ${_gitname} && git pull --rebase
	else
		git clone ${_gitroot}
	fi

	msg "GIT checkout done or server timeout"
	msg "Starting install..."
}

package() {
	cd "${srcdir}"
	install -m755 -d "${pkgdir}/usr/bin"
	install -m755 -d "${pkgdir}/usr/share/${_origname}/engines"
	install -m755 "${srcdir}/${_origname}/tv-"{dl,play} "${pkgdir}/usr/bin/"
	install -m644 "${srcdir}/${_origname}/engines/"*.py "${pkgdir}/usr/share/${_origname}/engines"
	# Set the path of engines
	sed -i -e "s/os.path.dirname(os.path.realpath(os.path.abspath(__file__)))/\'\/usr\/share\/tv-dl\/\'/" \
		"${pkgdir}/usr/bin/${_origname}"
}
