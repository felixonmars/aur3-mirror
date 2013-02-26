# Maintainer: Johannes Kern (johker) <johker AT johanneskern DOT net>
#
# If you're going to adapt this package to other printer models,
# here is a list of printer names and IDs:
#
#   name - id
# -------------
#  mp250 - 356
#  mp280 - 370
#  mp495 - 369
# mg5100 - 373
# mg5200 - 374
# mg6100 - 376
# mg8100 - 377
#
# Just change the following variables accordingly:
_name=mx710
_id=394

pkgname=scangearmp-${_name}
pkgver=1.90
pkgrel=1
_pkgver=1.90-1
pkgdesc="Canon Scanner Driver (${_name} series)"
url="http://www.canon-europe.com/Support/Consumer_Products/products/Fax__Multifunctionals/InkJet/PIXMA_MX_series/PIXMA_MX714.aspx"
arch=('i686' 'x86_64')
license=('custom')
depends=('sane' 'gimp')
source=(http://gdlp01.c-wss.com/gds/3/0100004143/01/scangearmp-source-${_pkgver}.tar.gz
        fix_png15.patch
        fix_configure.patch)
md5sums=('89d602545625157f1ec579e887fbce94'
         '6609d7fe171e67451658a3665442972c'
         'fa6365bcdd7ae7e6ae8976cb534fd2a5')

if [ "$CARCH" == "x86_64" ]; then  
	_libdir=libs_bin64
else
	_libdir=libs_bin32
fi

build() {
	# Apply patches
	cd ${srcdir}/scangearmp-source-${_pkgver}
	patch -p1 -i ${srcdir}/fix_png15.patch || return 1
	patch -p1 -i ${srcdir}/fix_configure.patch || return 1
	
	# Prepare build
	cd ${srcdir}/scangearmp-source-${_pkgver}/scangearmp
	./autogen.sh --prefix=/usr LDFLAGS="-L`pwd`/../com/${_libdir}" LIBS=-lm
	
	# Force the use of system's libtool
	rm libtool
	ln -s `which libtool` .
	
	# Build package
	make clean || return 1
	make || return 1	
}

package() {
	# Install package
	cd ${srcdir}/scangearmp-source-${_pkgver}/scangearmp
	make install DESTDIR=${pkgdir} || return 1

	# Install common libraries
	install -d ${pkgdir}/usr/lib/
	cp -d ${srcdir}/scangearmp-source-${_pkgver}/com/${_libdir}/* ${pkgdir}/usr/lib/
	
	# Install model specific libraries
	cp -d ${srcdir}/scangearmp-source-${_pkgver}/${_id}/${_libdir}/* ${pkgdir}/usr/lib/
	
	# Make scangearmp usable from gimp
	install -d ${pkgdir}/usr/lib/gimp/2.0/plug-ins/
	ln -s /usr/bin/scangearmp ${pkgdir}/usr/lib/gimp/2.0/plug-ins/

	# Install model specific .tbl and .dat files
	install -d ${pkgdir}/usr/lib/bjlib/
	install ${srcdir}/scangearmp-source-${_pkgver}/${_id}/*.tbl ${pkgdir}/usr/lib/bjlib/
	install ${srcdir}/scangearmp-source-${_pkgver}/${_id}/*.DAT ${pkgdir}/usr/lib/bjlib/
	
	# Install .ini file
	install -m 666 ${srcdir}/scangearmp-source-${_pkgver}/com/ini/canon_mfp_net.ini ${pkgdir}/usr/lib/bjlib/

	# Fix and install udev rules
	sed -i -e 's/SYSFS/ATTR/g' ${srcdir}/scangearmp-source-${_pkgver}/scangearmp/etc/80-canon_mfp.rules
	install -d ${pkgdir}/etc/udev/rules.d/
	install -m 644 ${srcdir}/scangearmp-source-${_pkgver}/scangearmp/etc/80-canon_mfp.rules ${pkgdir}/etc/udev/rules.d/

	# Remove unneeded files
	rm ${pkgdir}/usr/lib/libsane-canon_mfp.a
	rm ${pkgdir}/usr/lib/libsane-canon_mfp.la

	# Install license files
	cd ${srcdir}/scangearmp-source-${_pkgver}
	install -d ${pkgdir}/usr/share/licenses/${pkgname}/
	install -m 644 LICENSE-* ${pkgdir}/usr/share/licenses/${pkgname}/
}

# vim:set ts=2 sw=2 et:
