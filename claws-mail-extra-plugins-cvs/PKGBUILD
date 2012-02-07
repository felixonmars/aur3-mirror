# Maintainer: Christian Hesse <mail@eworm.de>
# Contributor: Andreas Radke <andyrtr@archlinux.org> ([extra] package)
# Contributor: Mildred <mildred593 at online dot fr>

pkgname=claws-mail-extra-plugins-cvs
pkgver=20120207
pkgrel=1
pkgdesc="Extra plugins for claws-mail - cvs checkout"
url="http://www.claws-mail.org/plugins.php?branch=EXT"
license=('GPL3')
arch=('i686' 'x86_64')
depends=('claws-mail-cvs')
makedepends=('make' 'cvs' 'bc' 'perl>=5.10.1-5' 'libgtkhtml>=2.11.1-2' 'libnotify>=0.7'
             'libxml2>=2.7.6' 'curl>=7.19.7' 'libytnef>=1.5-2' 'libwebkit>=1.6.1'
             'pygtk>=2.16.0' 'libsoup-gnome' 'libcanberra' 'libgdata' 'synce-libsynce'
	     'synce-librapi' 'poppler-glib')
optdepends=('libgtkhtml: for gtkhtml2_viewer plugin'
            'perl: for perl plugin'
            'libnotify: for notification plugin'
            'libcanberra: for notification plugin'
            'dbus-core: for notification plugin'
            'libxml2: for gtkhtml2_viewer and rssyl plugins'
            'curl: for gtkhtml2_viewer, vcalendar, rssyl and spamreport plugins'
            'libarchive: for archive plugin'
            'libytnef: for tnef_parse plugin'
            'libwebkit: for the fancy webkit html plugin'
            'libsoup-gnome: for the fancy webkit html plugin'
            'python2: for python plugin'
	    'libgdata: for gdata plugin'
	    'poppler-glib: for pdf_viewer plugin')
conflicts=('claws-mail-extra-plugins'
           'claws-gtkhtml2_viewer' 'claws-mail-acpinotifier-plugin'
           'sylpheed-claws-gtkhtml2-plugin' 'sylpheed-claws-rssyl-plugin'
           'sylpheed-claws-extra-plugins' 'claws-tnef-plugin'
           'claws-webkit-plugin-svn' 'claws-mayflower-plugin-svn')
replaces=('sylpheed-claws-extra-plugins')
options=('!libtool' '!strip')

_cvsroot="anonymous@claws-mail.org:/"
_cvsmod="plugins"
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

	# fix for python2
	export PYTHON="/usr/bin/python2"

	# fix build, docbook2txt ist missing...
	sed -i 's/README//' maildir/Makefile.am

	for dir in `find -maxdepth 1 -mindepth 1 -type d | egrep -v '^\./(CVS|geolocation|lpoppler_viewer|smime|pgpinline)$'`; do
		cd "${srcdir}/${_cvsmod}-build/${dir}"

		./autogen.sh
		./configure --prefix=/usr --disable-static
		make
	done
}

package() {
	cd "${srcdir}/${_cvsmod}-build"

	for dir in `find -maxdepth 1 -mindepth 1 -type d | egrep -v '^\./(CVS|geolocation|lpoppler_viewer|smime|pgpinline)$'`; do
		make -C ${dir} DESTDIR="${pkgdir}" install
	done

	# fix fileconflict with libical, #11485
	rm -f "${pkgdir}/usr/include/ical.h"
}
md5sums=()
