# Maintainer: Jonas Hörsch <coroa@online.de>

pkgname=scangearmp
pkgver=1.00
pkgrel=2
pkgdesc="Canon Scanner Driver (For PIXMA MP510 and possibly other Canon scanners)"
url="http://support-au.canon.com.au/contents/AU/EN/0900706603.html"
#url="http://software.canon-europe.com/software/0028482.asp"
arch=('i686' 'x86_64')
license=('custom')
depends=('sane' 'gtk2>=2.4.0' 'gimp>=2.0.0' 'libpng>=1.2.8' 'libusb>=0.1.12')
makedepends=('rpmextract' 'automake>=1.9.5' 'autoconf>=2.59')
source=("http://gdlp01.c-wss.com/gds/6/0900007066/02/${pkgname}-common-${pkgver}-2.src.rpm")
md5sums=('b2fcd29f2bb905df50c450a576657f01')
options=(docs)
install=${pkgname}.install

build() {
	cd "${srcdir}"
	rpmextract.sh "${pkgname}-common-${pkgver}-2.src.rpm" || return 1
	tar xzf "${pkgname}-common-${pkgver}-2.tar.gz" || return 1

	cd "${srcdir}/${pkgname}-common-${pkgver}"

	install -d ${pkgdir}/usr/share/doc/${pkgname}
	install -m644 LICENSE-scangearmp-1.00E.txt LICENSE-scangearmp-1.00J.txt ${pkgdir}/usr/share/doc/${pkgname}
	install -m644 -D LICENSE-scangearmp-1.00E.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE


	pushd "scangearmp"
	echo Patching sane driver to use the right function names
	sed -i -e 's|^//#define __USE_LIBSANE__$|#define __USE_LIBSANE__|' backend/canon_mfp.c

	libtoolize --copy --force
	./autogen.sh --prefix=/usr --enable-libpath=/usr/lib LDFLAGS="-L$(pwd)/../libs_bin"
	make || return 1
	make DESTDIR="${pkgdir}/" install

	install -d "${pkgdir}/etc/sane.d"
	ln -sf "/usr/lib/bjlib/canon_mfp.conf" "${pkgdir}/etc/sane.d/canon_mfp.conf"

	install -d "${pkgdir}/usr/lib/sane"
	for i in ${pkgdir}/usr/lib/libsane-canon_mfp.*; do
	    ln -sf ${i#$pkgdir} ${pkgdir}/usr/lib/sane
	done

	install -m644 LICENSE README AUTHORS ChangeLog COPYING ${pkgdir}/usr/share/doc/${pkgname}
	popd


	# copy common library
	pushd libs_bin
	for i in *.so.*; do
		install -m755 "$i" "${pkgdir}/usr/lib"
		ln -sf "/usr/lib/$i" "${pkgdir}/usr/lib/${i%.so.*}.so"
	done
	popd

	# copy *.tbl and *.dat
	pushd 293
	install -d "${pkgdir}/usr/lib/bjlib"
	install -m0755 *.tbl *.dat "${pkgdir}/usr/lib/bjlib"
	popd

	# copy rules file
	pushd scangearmp
	install -d "${pkgdir}/etc/udev/rules.d"
	# SYSFS{} in rules files is obsolete
	sed -i -e "s|SYSFS|ATTRS|g" etc/*.rules
	install -m0644 etc/*.rules "${pkgdir}/etc/udev/rules.d"
	popd

	# setup symlinks for gimp
	GIMP2DIR1="/usr/lib/gimp/2.0/plug-ins"
	GIMP2DIR2="/opt/gnome/lib/gimp/2.0/plug-ins"

	if [ -d ${GIMP2DIR1} ]; then
	   install -d "${pkgdir}/${GIMP2DIR1}"
	   ln -sf /usr/bin/scangearmp "${pkgdir}/${GIMP2DIR1}/scangearmp"
	elif [ -d ${GIMP2DIR2} ]; then
	   install -d "${pkgdir}/${GIMP2DIR2}"
	   ln -sf /usr/bin/scangearmp "${pkgdir}/${GIMP2DIR2}/scangearmp"
	fi

	unset GIMP2DIR1 GIMP2DIR2
}
