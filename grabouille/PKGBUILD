# $Id: PKGBUILD,v 1.00 2009/05/14 00:20 darkbaboon Exp $
# Contributor: Ronan Rabouin <darkbaboon@gmail.com>

pkgname=grabouille
pkgver=0.5
pkgrel=1
license=('GPL')
arch=('x86_64')
pkgdesc="Graphism for kid"
url="http://polariscorp.free.fr/grabouille.php"
depends=('python-pygame')
source=(http://polariscorp.free.fr/apps/$pkgname-$pkgver.tar)
md5sums=('63618cf991cf626b0d0fd0d37567d6df')

build() {
mkdir -p $startdir/pkg/usr/share/games/$pkgname
cp -R $startdir/src/$pkgname/* $startdir/pkg/usr/share/games/$pkgname/
}
