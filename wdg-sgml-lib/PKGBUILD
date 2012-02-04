# Contributor: Garrett <http://floft.net/contact>
pkgname=wdg-sgml-lib
pkgver=1.1.5
pkgrel=1
pkgdesc="HTMLHelp.com offline HTML DTDs (for wdg-html-validator)"
arch=('any')
url='http://htmlhelp.com/tools/validator/offline/'
license=('GPL' 'PerlArtistic')
depends=()
source=(http://htmlhelp.com/tools/validator/src/wdg-sgml-lib-$pkgver.tar.gz)
md5sums=(47fc77f6477c3ce92403365d3e605f5e)

build() {
	mkdir -p "$pkgdir/usr/share/wdg/"
	cp -r "$srcdir/wdg/sgml-lib/" "$pkgdir/usr/share/wdg/"
}
