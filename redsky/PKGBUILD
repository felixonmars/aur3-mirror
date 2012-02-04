# Contributor: Glenn Matthys <glenn@webmind.be>
pkgname=redsky
pkgver=1.5
pkgrel=1
pkgdesc="An easily extensible email filter system written in PHP"
arch=('i686' 'x86_64')
url="http://projects.webmind.be/redsky"
depends=('php' 'phpemailtoolbox')
backup=(
	etc/redsky.config.php
)
source=(
	${url}/releases/${pkgname}-${pkgver}.tar.gz
)
md5sums=(5cc40817381d418510878b4ca0176660)
license=('BSD beerware enhanced')

build() {
	mkdir -p $startdir/pkg/etc
	mkdir -p $startdir/pkg/usr/bin
	mkdir -p $startdir/pkg/usr/share/php/redsky

	cd $startdir/src/${pkgname}-${pkgver}

	cp -R lib/* $startdir/pkg/usr/share/php/redsky

	install -m755 bin/redsky $startdir/pkg/usr/bin/redsky
	install -m644 etc/redsky.config.php $startdir/pkg/etc/redsky.config.php

	install -Dm644 LICENSE ${startdir}/pkg/usr/share/licenses/${pkgname}/LICENSE
}
