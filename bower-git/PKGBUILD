# Maintainer: Christian Hesse <mail@eworm.de>
# Contributor: cantabile <cantabile dot desu at gmail dot com>

pkgname=bower-git
pkgver=20120723
pkgrel=1
pkgdesc="Bower - front-end for notmuch mail"
arch=('i686' 'x86_64')
url='https://github.com/wangp/bower'
license=('GPL')
depends=('notmuch' 'ncurses' 'coreutils' 'file')
makedepends=('git' 'mercury-compiler')
provides=('bower')

_gitroot="git://github.com/wangp/bower.git"
_gitname="bower"

build() {
	cd "${srcdir}"
	msg "Connecting to GIT server...."

	if [ -d ${_gitname} ] ; then
		cd ${_gitname} && git pull origin
		msg "The local files are updated."
	else
		git clone ${_gitroot} ${_gitname}
	fi

	msg "GIT checkout done or server timeout"
	msg "Starting make..."

	rm -rf "${srcdir}/${_gitname}-build"
	git clone "${srcdir}/${_gitname}" "${srcdir}/${_gitname}-build"
	cd "${srcdir}/${_gitname}-build"

	#
	# BUILD HERE
	#

	make
}

package() {
	cd "${srcdir}/${_gitname}-build"
	mkdir -p "${pkgdir}/usr/bin"
  mkdir -p "${pkgdir}/usr/share/bower"
	cp "${srcdir}/${_gitname}-build/bower" "${pkgdir}/usr/bin/"
  cp "${srcdir}/${_gitname}-build/bower.conf.sample" "${pkgdir}/usr/share/bower/"
  cp "${srcdir}/${_gitname}-build/README.md" "${pkgdir}/usr/share/bower/"

} 

sha256sums=('')
