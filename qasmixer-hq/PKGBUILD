# Contributor: PyrO_70 <brieuc.roblin@gmail.com>
pkgname=qasmixer-hq
pkgver=1566
pkgrel=1
pkgdesc="Volume manager for ALSA in Qt."
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/qasmixer"
license="GPLv3"
depends=(qt alsa-lib)
makedepends=(make gcc mercurial cmake)

_hgrepo="qasmixer"
_hgroot="http://qasmixer.hg.sourceforge.net:8000/hgroot/qasmixer/qasmixer"

build() {
	cd ${srcdir}

	msg "Downloading source using Mercurial..."
	rm -fr ${_hgrepo} &> /dev/null
	hg clone ${_hgroot} ${_hgrepo} || return 1
	msg "Clone done or server timeout"

	msg "Starting cmake..."
	cd ${_hgrepo}
  cmake -DCMAKE_INSTALL_PREFIX:PATH="$pkgdir"/usr .
  make
}

package() {
  cd ${srcdir}/${_hgrepo}
	# Installing include
	msg "Installing..."
  make install
}
