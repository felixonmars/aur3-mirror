# Maintainer: Johannes Kern (johker) <johker AT johanneskern DOT net>
#
# If you're going to adapt this package to other printer models,
# here is a list of printer names and IDs:
#
#   name - id
# -------------
# e600 - 399
# ip100 - 303
# mx370 - 396
# mx430 - 397
# mx510 - 398
# mx710 - 394
# mx890 - 395
#
# Just change the following variables accordingly:
_name=mx710
_id=394

pkgname=cnijfilter-${_name}
pkgver=3.70
pkgrel=1
_pkgver=3.70-1
pkgdesc="Canon IJ Printer Driver (${_name} series)"
url="http://www.canon-europe.com/Support/Consumer_Products/products/Fax__Multifunctionals/InkJet/PIXMA_MX_series/PIXMA_MX714.aspx"
arch=('i686' 'x86_64')
license=('custom')
depends=('popt' 'gtk2' 'cups')
source=(http://gdlp01.c-wss.com/gds/8/0100004118/01/cnijfilter-source-${_pkgver}.tar.gz
        fix_cups.patch
        fix_png.patch
        fix_ppd_mx710.patch
        fix_configures.patch)
md5sums=('0f23002a95c4dc9e8b85fe612d0cff0b'
         '1355804664f5901c68a446de36d933de'
         '5f665042df2175da3629667aaf258782'
         '0464387cbbf92a5b5dca655b66600617'
         '07a318c78df391a9ac5f69aab001155e')

if [ "$CARCH" == "x86_64" ]; then
	_libdir=libs_bin64
else
	_libdir=libs_bin32
fi

build() {
	## Apply patches
	cd ${srcdir}/cnijfilter-source-${_pkgver}
	patch -p1 -i ${srcdir}/fix_cups.patch || return 1
	patch -p1 -i ${srcdir}/fix_png.patch || return 1
	patch -p1 -i ${srcdir}/fix_ppd_mx710.patch || return 1
	patch -p1 -i ${srcdir}/fix_configures.patch || return 1

	## Compile model specific stuff
	# ppd file
	msg "Compile PPD file..."
	cd ${srcdir}/cnijfilter-source-${_pkgver}/ppd
	./autogen.sh --prefix=/usr --enable-ppdpath=/usr/share/cups/model --program-suffix=${_name}
	make clean || return 1
	make || return 1
	# cnijfilter
	msg "Compile cnijfilter..."
	cd ${srcdir}/cnijfilter-source-${_pkgver}/cnijfilter
	./autogen.sh --prefix=/usr --enable-libpath=/usr/lib/bjlib --enable-binpath=/usr/bin --program-suffix=${_name}
	make clean || return 1
	make || return 1
	# printui
	msg "Compile printui..."
	cd ${srcdir}/cnijfilter-source-${_pkgver}/printui
	./autogen.sh --prefix=/usr --datadir=/usr/share --program-suffix=${_name}
	make || true # Needed to avoid errors while building locales
	make clean || return 1
	make || return 1
	# lgmon
	msg "Compile lgmon..."
	cd ${srcdir}/cnijfilter-source-${_pkgver}/lgmon
	./autogen.sh --prefix=/usr --enable-progpath=/usr/bin --program-suffix=${_name}
	make clean || return 1
	make || return 1
	# cngpijmon
	msg "Compile cngpijmon..."
	cd ${srcdir}/cnijfilter-source-${_pkgver}/cngpijmon
	./autogen.sh --prefix=/usr --enable-progpath=/usr/bin --datadir=/usr/share --program-suffix=${_name}
	make clean || return 1
	make || return 1

	## Compile common stuff
	# libs
	msg "Compile libs..."
	cd ${srcdir}/cnijfilter-source-${_pkgver}/libs
	./autogen.sh --prefix=/usr
	make clean || return 1
	make || return 1
	# cngpij
	msg "Compile cngpij..."
	cd ${srcdir}/cnijfilter-source-${_pkgver}/cngpij
	./autogen.sh --prefix=/usr --enable-progpath=/usr/bin
	make clean || return 1
	make || return 1
	# pstocanonij
	msg "Compile pstocanonij..."
	cd ${srcdir}/cnijfilter-source-${_pkgver}/pstocanonij
	./autogen.sh --prefix=/usr --enable-progpath=/usr/bin
	make clean || return 1
	make || return 1
	# backend
	msg "Compile backend..."
	cd ${srcdir}/cnijfilter-source-${_pkgver}/backend
	./autogen.sh --prefix=/usr --enable-progpath=/usr/bin
	make clean || return 1
	make || return 1
	# backendnet
	msg "Compile backendnet..."
	cd ${srcdir}/cnijfilter-source-${_pkgver}/backendnet
	./autogen.sh --prefix=/usr --enable-progpath=/usr/bin LDFLAGS="-L../../com/${_libdir}"
	make clean || return 1
	make || return 1
	# sm sub process
	msg "Compile sm sub process..."
	cd ${srcdir}/cnijfilter-source-${_pkgver}/cngpijmon/cnijnpr
	./autogen.sh --prefix=/usr LIBS=-ldl
	make clean || return 1
	make || return 1
}

package() {
	## Install model specific stuff
	# ppd file
	cd ${srcdir}/cnijfilter-source-${_pkgver}/ppd
	make install DESTDIR=${pkgdir} || return 1
	# cnijfilter
	cd ${srcdir}/cnijfilter-source-${_pkgver}/cnijfilter
	make install DESTDIR=${pkgdir} || return 1
	# printui
	cd ${srcdir}/cnijfilter-source-${_pkgver}/printui
	make install DESTDIR=${pkgdir} || return 1
	# lgmon
	cd ${srcdir}/cnijfilter-source-${_pkgver}/lgmon
	make install DESTDIR=${pkgdir} || return 1
	# cngpijmon
	cd ${srcdir}/cnijfilter-source-${_pkgver}/cngpijmon
	make install DESTDIR=${pkgdir} || return 1

	## Install common stuff
	# libs
	cd ${srcdir}/cnijfilter-source-${_pkgver}/libs
	make install DESTDIR=${pkgdir} || return 1
	# cngpij
	cd ${srcdir}/cnijfilter-source-${_pkgver}/cngpij
	make install DESTDIR=${pkgdir} || return 1
	# pstocanonij
	cd ${srcdir}/cnijfilter-source-${_pkgver}/pstocanonij
	make install DESTDIR=${pkgdir} || return 1
	# backend
	cd ${srcdir}/cnijfilter-source-${_pkgver}/backend
	make install DESTDIR=${pkgdir} || return 1
	# backendnet
	cd ${srcdir}/cnijfilter-source-${_pkgver}/backendnet
	make install DESTDIR=${pkgdir} || return 1
	# sm sub process
	cd ${srcdir}/cnijfilter-source-${_pkgver}/cngpijmon/cnijnpr
	make install DESTDIR=${pkgdir} || return 1

	## Install model specific libraries
	install -d ${pkgdir}/usr/lib/
	install -d ${pkgdir}/usr/lib/bjlib/
	cp -d ${srcdir}/cnijfilter-source-${_pkgver}/${_id}/${_libdir}/* ${pkgdir}/usr/lib/
	cp -d ${srcdir}/cnijfilter-source-${_pkgver}/${_id}/database/* ${pkgdir}/usr/lib/bjlib/

	## Install common libraries
	cp -d ${srcdir}/cnijfilter-source-${_pkgver}/com/${_libdir}/* ${pkgdir}/usr/lib/
	install -m 666 ${srcdir}/cnijfilter-source-${_pkgver}/com/ini/cnnet.ini ${pkgdir}/usr/lib/bjlib/

	## Install license files
	cd ${srcdir}/cnijfilter-source-${_pkgver}
	install -d ${pkgdir}/usr/share/licenses/${pkgname}/
	install -m 644 LICENSE-* ${pkgdir}/usr/share/licenses/${pkgname}/
}

# vim:set ts=2 sw=2 et:
