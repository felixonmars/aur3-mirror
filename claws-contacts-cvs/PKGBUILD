# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=claws-contacts-cvs
pkgver=20120407
pkgrel=1
pkgdesc="A GTK+ based contacts manager / address book - cvs checkout"
arch=('i686' 'x86_64')
license=('GPL3')
url="http://www.claws-mail.org/"
depends=('gtk2')
makedepends=('cvs')
conflicts=('claws-contacts')
provides=('claws-contacts')
options=(!libtool)
install=claws-contacts.install

_cvsroot="anonymous@claws-mail.org:/"
_cvsmod="contacts"
#_cvsbranch="gtk2"

build() {
	cd "${srcdir}"

	if [ -d "${_cvsmod}/CVS" ]; then
		msg "Starting CVS update ..."
		cd "${_cvsmod}"
		cvs -z3 update -d
		msg "... updating finished."
	else
		msg "Starting CVS checkout ..."
		#cvs -z3 -d:pserver:${_cvsroot} co -r "${_cvsbranch}" "${_cvsmod}"
		cvs -z3 -d:pserver:${_cvsroot} co "${_cvsmod}"
		msg "... checkout finished."
		cd "${_cvsmod}"
	fi

	if [ -e "${srcdir}/${_cvsmod}-build" ]; then
		rm -rf "${srcdir}/${_cvsmod}-build"
	fi

	msg "CVS checkout done or server timeout"

	cp -a "${srcdir}/${_cvsmod}" "${srcdir}/${_cvsmod}-build"
	cd "${srcdir}/${_cvsmod}-build"

	./autogen.sh --prefix=/usr --disable-static
	for MAKEFILE in `find -name Makefile`; do
		sed -i '/^LIBS =/s/$/ -lm/' ${MAKEFILE}
	done
	make
}

package() {
	cd "${srcdir}/${_cvsmod}-build"

	make DESTDIR=${pkgdir} install
}
