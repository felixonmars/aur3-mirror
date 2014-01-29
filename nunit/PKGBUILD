# Contributor: Jan Stępień <jstepien@users.sourceforge.net>

pkgname=nunit
pkgver=2.6.3
pkgrel=1
pkgdesc="Unit-testing framework for all .NET languages."
arch=('any')
license=('custom')
url="http://www.nunit.com"
depends=('mono')
source=(nunit.sh
	http://launchpad.net/nunitv2/trunk/$pkgver/+download/NUnit-$pkgver.zip)
md5sums=('7bf17d38092de3f5bcd5fd96dbef0c62'
         '0acd842acc761a0866a9b9750e3efca7')

build() {
	install -D -m755 nunit.sh $pkgdir/usr/bin/nunit || return 1
	cd "$startdir/src/NUnit-$pkgver" || return 1
	mkdir -p $pkgdir/usr/{share/doc,share/licenses,lib}/$pkgname
	cp -r bin/* $pkgdir/usr/lib/$pkgname || return 1
	install -D -m644 license.txt $pkgdir/usr/share/licenses/$pkgname/ \
		|| return 1
	cp -r doc/* $pkgdir/usr/share/doc/$pkgname || return 1
}
