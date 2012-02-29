# Maintainer:   vando   <vando|SPAM.OFF|van.do>
pkgname=slrnpull
pkgver=0.9.9p1
pkgrel=7
pkgdesc="Pull a small newsfeed from an NNTP server (without install slrn)"
arch=('i686' 'x86_64')
url="http://slrn.sourceforge.net/"
license=('GPL')
depends=('slang')
source=("http://downloads.sourceforge.net/slrn/slrn-$pkgver.tar.gz")
md5sums=('6cc8ac6baaff7cc2a8b78f7fbbe3187f')

build() {
	
	cd ${srcdir}/slrn-${pkgver}
	./configure
	make || return 1
	make slrnpull || return 1

}

package() {

	install -Dm 755 ${srcdir}/slrn-${pkgver}/src/objs/slrnpull ${pkgdir}/usr/bin/slrnpull
	for _doc in README README.offline score SETUP slrnpull.conf slrnpull.sh 
	do
		install -Dm 644 ${srcdir}/slrn-${pkgver}/doc/slrnpull/${_doc} ${pkgdir}/usr/share/slrnpull/${_doc}
	done

}
