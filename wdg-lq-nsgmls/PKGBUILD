# Contributor: Garrett <http://floft.net/contact>
pkgname=wdg-lq-nsgmls
pkgver=1.3.4.14
pkgrel=1
pkgdesc="HTMLHelp.com offline HTML parser (for wdg-html-validator)"
arch=('any')
url='http://htmlhelp.com/tools/validator/offline/'
license=('GPL' 'PerlArtistic')
source=(http://htmlhelp.com/tools/validator/src/lq-sp-$pkgver.tar.gz)
md5sums=(9b65ab0dc4409d5907898be3e8cb0133)

build() {
	cd "$srcdir/lq-sp-$pkgver"
	#Makefile doesn't support PREFIX and DESTDIR
	sed -i 's#prefix=/usr/local#prefix=/usr#g' Makefile
	sed -i "s#bindir=\$(exec_prefix)/bin#bindir=$pkgdir/usr/bin#g" Makefile
	make
}

package() {
	cd "$srcdir/lq-sp-$pkgver"
	#since it won't create it on it's own...
	mkdir -p "$pkgdir/usr/bin"
	make install 
}
