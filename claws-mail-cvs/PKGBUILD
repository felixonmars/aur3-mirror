# Maintainer: Christian Hesse <mail@eworm.de>
# Contributor: Andreas Radke <andyrtr@archlinux.org> ([extra] package)

pkgname=claws-mail-cvs
pkgver=20120407
pkgrel=1
pkgdesc="A GTK+ based e-mail client - cvs checkout"
arch=('i686' 'x86_64')
license=('GPL3')
url="http://www.claws-mail.org/"
depends=('claws-contacts' 'gtk2' 'gnutls' 'startup-notification' 'pilot-link' 'enchant'
         'gpgme' 'libetpan' 'libsm' 'db' 'dbus-glib' 'hicolor-icon-theme' 'desktop-file-utils')
makedepends=('compface' 'spamassassin' 'bogofilter' 'valgrind' 'cvs')
optdepends=('python2:           needed for some tools'
            'perl:              needed for some tools'
            'spamassassin:      adds support for spamfiltering'
            'bogofilter:        adds support for spamfiltering')
replaces=('sylpheed-claws')
conflicts=('claws-mail')
provides=('claws' 'claws-mail')
options=(!libtool)
install=claws-mail.install
source=("claws_gnutls.patch::http://www.thewildbeast.co.uk/claws-mail/bugzilla/attachment.cgi?id=1104")

_cvsroot="anonymous@claws-mail.org:/"
_cvsmod="claws"
_cvsbranch="gtk2"

build() {
	cd "${srcdir}"

	if [ -d "${_cvsmod}/CVS" ]; then
		msg "Starting CVS update ..."
		cd "${_cvsmod}"
		cvs -z3 update -d
		msg "... updating finished."
	else
		msg "Starting CVS checkout ..."
		cvs -z3 -d:pserver:${_cvsroot} co -r "${_cvsbranch}" "${_cvsmod}"
		msg "... checkout finished."
		cd "${_cvsmod}"
	fi

	if [ -e "${srcdir}/${_cvsmod}-build" ]; then
		rm -rf "${srcdir}/${_cvsmod}-build"
	fi

	msg "CVS checkout done or server timeout"

	cp -a "${srcdir}/${_cvsmod}" "${srcdir}/${_cvsmod}-build"
	cd "${srcdir}/${_cvsmod}-build"

	sed -i 's@^#!.*python.*@#!/usr/bin/python2@' tools/*.py

	# http://www.thewildbeast.co.uk/claws-mail/bugzilla/show_bug.cgi?id=2646
	patch -Np1 < ${srcdir}/claws_gnutls.patch

	./autogen.sh --prefix=/usr --disable-static \
		--enable-enchant \
		--enable-gnutls \
		--enable-ldap \
		--disable-dillo-viewer-plugin \
		--enable-crash-dialog \
		--enable-pgpmime-plugin \
		--enable-spamassassin-plugin \
		--enable-bogofilter-plugin \
		--enable-jpilot \
		--enable-new-addrbook

	make
}

package() {
	cd "${srcdir}/${_cvsmod}-build"

	make DESTDIR=${pkgdir} install

	# build and install extra tools
	cd tools
	make
	# all executables and .conf files ; only top directory
	for FILE in `find -maxdepth 1 -type f -and -perm /111 -or -name '*.conf'`; do
		install -D -m755 ${FILE} ${pkgdir}/usr/lib/claws-mail/tools/${FILE}
	done
}
sha256sums=('79381ab69961970bdc44d92e6d69abe7a667ac6fa18fb19394dd531c40688a66')
