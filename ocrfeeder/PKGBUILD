# Contributor: Sergey Kolesov <cucullus.at.mail.ru>

pkgname=ocrfeeder
pkgver=0.7.6
pkgrel=1
pkgdesc="A document layout analysis and optical character recognition system"
url="http://live.gnome.org/OCRFeeder"
arch=('any')
license=('GPL')
depends=('pygoocanvas>=0.12' 'ghostscript>=8.63' 'unpaper>=0.3' 'python-imaging' 'python2-libgnome' 'python2-pyenchant' 'python2-gtkspell' 'desktop-file-utils' 'python-reportlab')
makedepends=('gnome-doc-utils')
optdepends=('cuneiform: OCR engine' 'tesseract: OCR engine' 'ocrad: OCR engine' 'gocr: OCR engine')
source=("http://ftp.gnome.org/pub/GNOME/sources/ocrfeeder/0.7/${pkgname}-${pkgver}.tar.bz2")
install=$pkgname.install

md5sums=('a9a96a5b72ed5765ad56653e5a6d1e01')

build() {
    cd ${srcdir}/${pkgname}-${pkgver}

    # python2 fix
    sed -i 's@^#!.*python$@#!/usr/bin/python2@' bin/ocrfeeder*.in src/ocrfeeder/odf/*.py

    ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
	--disable-scrollkeeper \
	PYTHON=python2
    make
}

package() {
    cd ${srcdir}/${pkgname}-${pkgver}

    make DESTDIR=$pkgdir install
    mkdir -p $pkgdir/usr/share/pixmaps
    ln -s ../${pkgname}/icons/${pkgname}.svg ${pkgdir}/usr/share/pixmaps/${pkgname}.svg
}
