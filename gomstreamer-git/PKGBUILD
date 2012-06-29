# Maintainer: Daniel Wallace <daniel.wallace12@gmail.com>

pkgname=gomstreamer-git
pkgver=20120628
pkgrel=1
pkgdesc="Watch or Save(or delayed) the GSL stream"
arch=('i686' 'x86_64')
url="http://sjp.co.nz/projects/gomstreamer/"
license=('GPL')
makedepends=('git')
depends=('python2' 'wget' 'vlc')
optdepends=('gomplay-git: this can be used to easily control gomstreamer')
provides=('gomstreamer.py' 'playgom' 'schedule-playgom')

_gitroot="https://github.com/sjp/GOMstreamer.git"
_gitname="GOMstreamer"

build() {
	#cd ${srcddir}
	msg "checking git..."
	if [ -d ${_gitname} ]; then
		cd ${_gitname} && git pull origin
	else
		git clone ${_gitroot}
	fi
	rm -rf ${srcdir}/${_gitname}-build 
	git clone "${srcdir}/${_gitname}" "${srcdir}/${_gitname}-build"
}
package(){
	cd "${srcdir}/${_gitname}-build"
	install -D -m755 "${srcdir}/${_gitname}-build/gomstreamer.py" "${pkgdir}/usr/bin/gomstreamer.py"
	install -D -m755 "${srcdir}/${_gitname}-build/linux/scheduled-play.sh" "${pkgdir}/usr/bin/scheduled-playgom"
	install -D -m755 "${srcdir}/${_gitname}-build/linux/play.sh" "${pkgdir}/usr/bin/playgom"
}
