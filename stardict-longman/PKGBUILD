# Contributor: Michal Karas <largon@largon.net>

pkgname=stardict-longman
pkgver=2.4.2
pkgrel=5
pkgdesc="Longman dictionary for Stardict"
arch=('any')
depends=('stardict')
url="http://code.google.com/p/stardict-3/"
license=('custom')
source=('http://abloz.com/huzheng/stardict-dic/babylon/en/stardict-babylon-Longman-2.4.2.tar.bz2'
		'COPYING')
md5sums=('a6e8c1b3174c4f00e99017b278957436' 
		'b13689675df5b5f392e054b3595d745f')

build() {
	true
}

package() {
	cd ${srcdir}/stardict-babylon-Longman-${pkgver}
	mkdir -p ${pkgdir}/usr/share/stardict/dic/
	cp -a ${srcdir}/stardict-babylon-Longman-${pkgver} ${pkgdir}/usr/share/stardict/dic/

	mkdir -p $pkgdir/usr/share/licenses/stardict-longman/
	install -m 644 ${srcdir}/COPYING ${pkgdir}/usr/share/licenses/stardict-longman/
}
