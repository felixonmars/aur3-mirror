# Maintainer: Matej Lach <matej.lach@gmail.com>

pkgname=gggooglescan
pkgver=0.4
pkgrel=1
pkgdesc='Google scraper for automated searching.'
arch=('any')
url='http://www.morningstarsecurity.com/research/gggooglescan'
license='GPL3'
source=('http://www.morningstarsecurity.com/downloads/gggooglescan-0.4.tar.gz')
md5sums=('63316923251b7dbc84d7455f7fdd9515')

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -D -m755 gggooglescan ${pkgdir}/usr/bin/gggooglescan
}