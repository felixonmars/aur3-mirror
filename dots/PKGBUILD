pkgname='dots'
pkgver='0.1.2'
pkgrel='1'
pkgdesc='A braille translator for GNOME desktop environment'
license='GPL-3'
url='http://live.gnome.org/Dots'
source=( "http://ftp.gnome.org/pub/GNOME/sources/${pkgname}/0.1/${pkgname}-${pkgver}.tar.bz2" )
sha1sums=( 'dd97ea34da1572e79fa10e28f7d25ec6eecbc80d' )
arch=( 'i686' 'x86_64' )
depends=( 'liblouisxml' 'python2-odfpy' )

build () {
	cd "${srcdir}/${pkgname}-${pkgver}"
	PYTHON=python2 ./configure --prefix=/usr
	make PYTHON=python2
}

package () {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make PYTHON=python2 DESTDIR="${pkgdir}/" install

	# The default "python" symlink in Arch points to "python3", so it is safer
	# to edit the she-bang in the scripts and explicitly set the interpreter.
	#
	for script in "${pkgdir}/usr/bin"/* ; do
		if grep -q python <<< "$(head -1 "${script}")" ; then
			sed -i -e '1i#! /usr/bin/python2' "${script}"
		fi
	done
}
