pkgname=fortune-mod-queerasfolk
pkgver=3
pkgrel=1
pkgdesc="Fortune Cookies: Queer As Folk"
arch=('any')
license=('GPL')
depends=('fortune-mod')
url=('https://wuyao1224.wordpress.com/2007/07/09/quotes-of-brian-kinney-from-queer-as-folk/')
source=('http://smith.freeunix.net/queerasfolk')
md5sums=('5b453649300c9a7efbf27df561c616db')

build() {
	cd ${srcdir}
	strfile queerasfolk queerasfolk.dat
	install -D -m644 queerasfolk ${pkgdir}/usr/share/fortune/queerasfolk
	install -D -m644 queerasfolk.dat ${pkgdir}/usr/share/fortune/queerasfolk.dat
}
