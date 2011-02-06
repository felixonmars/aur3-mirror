# Contributor: Andrew Grigorev <andrew@ei-grad.ru>
#

pkgname=rlib
pkgver=1.3.7
pkgrel=1
pkgdesc="Advanced reporting engine that generates professional reports in PDF, HTML, CSV, and text formats from a simple XML definition language."
arch=('i686' 'x86_64')
url="http://rlib.sicompos.com/"
license=('GPL')
source=(http://downloads.sourceforge.net/project/rlib/rlib/rlib-1.3.7/rlib-1.3.7.tar.gz)
md5sums=('06b3e629c6f99a8b2fd1264f32db8f56')

build() {
	cd ${srcdir}/${pkgname}-${pkgver}

	./configure --prefix=/usr --enable-utf8 --enable-python --with-pythonver=2.7
        make || return 1
	make DESTDIR="${pkgdir}" install
}

