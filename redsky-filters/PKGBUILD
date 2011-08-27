# Contributor: Glenn Matthys <glenn@webmind.be>
pkgname=redsky-filters
pkgdesc='A set of additional filters for redsky'
pkgver=1.0
pkgrel=1
arch=('i686' 'x86_64')
url='http://projects.webmind.be/redsky-filters'
depends=('php' 'redsky')
source=(
	${url}/releases/${pkgname}-${pkgver}.tar.gz
)
md5sums=('42b15ae411595828885113673eaaae9f')
license=('BSD beerware enhanced')

build() {
	mkdir -p $startdir/pkg/usr/share/php/redsky

	cd $startdir/src/${pkgname}-${pkgver}

	cp -R lib/* $startdir/pkg/usr/share/php/redsky
}
