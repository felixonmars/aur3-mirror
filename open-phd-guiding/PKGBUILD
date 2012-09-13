pkgname=open-phd-guiding
pkgver=svn
pkgrel=1
pkgdesc="Linux port of PHD Guiding, autoguiding for telescopes"
url="http://code.google.com/p/open-phd-guiding/"
arch=('i686' 'x86_64')
license=('BSD3')
depends=('wxgtk' 'v4l-utils' 'zlib' 'cfitsio')
#optdepends=('')
makedepends=('cmake gcc')
#source=()
#sha1sums=()

_svn_URL="http://open-phd-guiding.googlecode.com/svn/trunk/"

build() {
	cd "${srcdir}"
	if [ -d "${pkgname}/.svn" ]; then
		msg "Starting SVN update..."
		(cd "${pkgname}" && svn up)
	else
		msg "Starting SVN checkout..."
		svn co "${_svn_URL}" --config-dir ./ "${pkgname}"
	fi
	msg "SVN checkout done or server timeout"
	cd "${pkgname}"
	cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr .
	make all
}

package() {
	cd "${srcdir}/${pkgname}"
	make DESTDIR="${pkgdir}" install
}

