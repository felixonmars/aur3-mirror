# Contributor: Glenn Matthys <glenn@webmind.be>
pkgname=mlm-filters
pkgdesc='A set of mailinglist filters for redsky'
pkgver=1.1
pkgrel=1
arch=('i686' 'x86_64')
url='http://projects.webmind.be/mlm-filters'
depends=('php' 'redsky')
source=(
	${url}/releases/${pkgname}-${pkgver}.tar.gz
)
license=('BSD beerware enhanced')
md5sums=('b221b696844e301009f6338308e5acab')

build() {
	mkdir -p $startdir/pkg/usr/share/php/redsky

	cd $startdir/src/${pkgname}-${pkgver}

	cp -R lib/* $startdir/pkg/usr/share/php/redsky
}
