# Maintained by: danielwallace <daniel.wallace12@gmail.com>

pkgname=gomstream-git
pkgver=20111225
pkgrel=1
pkgdesc="Watch or Save(or delayed) the GSL stream"
arch=('any')
url="http://github.com/danielwallace/GOMstreamer"
license=('GPL')
makedepends=('git')
depend=('python2, wget,vlc')
provide=('gomstreamer, gomplay')

_gitroot="git://github.com/danielwallace/GOMstreamer.git"
_gitname="GOMstreamer"

build() {
	#cd ${srcddir}
	msg "checking git..."
	if [ -d ${_gitname} ]; then
		cd ${_gitname} && git pull origin
	else
		git clone ${_gitroot}
	fi

	msg "building..."
	rm -rf ${srcdir}/${_gitname}-build 
	
	git clone ${srcdir}/${_gitname} ${srcdir}/${_gitname}-build
}
package(){
	cd ${srcdir}/${_gitname}-build
	msg "installing..."
	install -D -m755 gomstreamer ${pkgdir}/usr/bin/gomstreamer || return 1
	install -D -m755 gomplay ${pkgdir}/usr/bin/gomplay || return 1
	cat README
}

