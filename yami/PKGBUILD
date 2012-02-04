# Contributor: Michał Małek <michalm@jabster.pl>

pkgname=yami
pkgver=3.3.1
pkgrel=1
pkgdesc="Yet Another Messaging Infrastructure"
arch=(i686 x86_64)
url="http://www.msobczak.com/prog/yami/"
license=('custom')
depends=('python' 'tcl')
source=(http://www.msobczak.com/prog/${pkgname}/impl/files/${pkgname}-${pkgver}.tar.gz
		config.patch
		license.txt)
md5sums=('3a07fd7f305c94c5c0fc340c0ecbe720'
         '6797710358c942b89a2671976d731ea7'
         'ac064ef1a2ce435d76db881abb1cd951')

build() {
	cd ${startdir}/src/${pkgname}-${pkgver}

	patch -p0 < ${startdir}/src/config.patch || return 1
	make || return 1

	mkdir -p ${startdir}/pkg/usr/include
	install -m644 include/*.h ${startdir}/pkg/usr/include/

	mkdir -p ${startdir}/pkg/usr/lib
	install -m644 lib/libyamic.a ${startdir}/pkg/usr/lib/

	mkdir -p ${startdir}/pkg/usr/lib/tcl8.5/${pkgname}
	install -m644 lib/pkgIndex.tcl ${startdir}/pkg/usr/lib/tcl8.5/${pkgname}/
	install -m755 lib/yamitcl.so ${startdir}/pkg/usr/lib/tcl8.5/${pkgname}/

	mkdir -p ${startdir}/pkg/usr/lib/python2.5
	install -m644 lib/YAMI.py ${startdir}/pkg/usr/lib/python2.5/
	install -m755 lib/yamipyc.so ${startdir}/pkg/usr/lib/python2.5/

	mkdir -p ${startdir}/pkg/usr/bin
	install -m755 tools/ydl/ydl ${startdir}/pkg/usr/bin/
	install -m755 tools/yping/yping ${startdir}/pkg/usr/bin/

	mkdir -p ${startdir}/pkg/usr/share/licenses/${pkgname}
	install -m644 ${startdir}/src/license.txt ${startdir}/pkg/usr/share/licenses/${pkgname}/
}
