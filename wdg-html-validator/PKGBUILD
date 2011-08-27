# Contributor: Garrett <http://floft.net/contact>
pkgname=wdg-html-validator
pkgver=1.2.3
pkgrel=1
pkgdesc="HTMLHelp.com offline HTML validator"
arch=('any')
url='http://htmlhelp.com/tools/validator/offline/'
license=('GPL' 'PerlArtistic')
depends=('wdg-lq-nsgmls' 'wdg-sgml-lib')
source=(http://htmlhelp.com/tools/validator/offline/validate)
md5sums=(d6e5f401ee5fc6f69fc442d8d011eaf5)

build() {
	cd "$srcdir/"
	sed -i "s#/usr/local/bin/lq-nsgmls#/usr/bin/lq-nsgmls#g" validate
	sed -i "s#/usr/local/share/wdg/sgml-lib#/usr/share/wdg/sgml-lib#g" validate
	install -Dm755 "$srcdir/validate" "$pkgdir/usr/bin/validate"
}
