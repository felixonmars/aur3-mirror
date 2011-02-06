# Conntributor: Matthew Bauer <mjbauer95@gmail.com>
language=php
_language=PHP
format=tar.gz
pkgname=ckfinder
_pkgname=CKFinder
pkgver=1.4.1.1
pkgrel=1
pkgdesc="CKFinder is a powerful and easy to use Ajax file manager for web browsers. Its simple interface makes it intuitive and quick to learn for all kinds of users, from advanced professionals to Internet beginners."
url="http://ckfinder.com/"
arch=(any)
license=('custom')
depends=($language)
source=(http://download.cksource.com/$_pkgname/$_pkgname%20for%20$_language/$pkgver/${pkgname}_${language}_${pkgver}.$format)
md5sums=('bd1ff487ec333c4d6b0e19f8f4e81600')

build() {
	mkdir -p $pkgdir/srv/http/ckfinder
	cp -r $srcdir/$pkgname/* $pkgdir/srv/http/ckfinder
}
