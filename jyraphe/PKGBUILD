# Contributor: Geoffroy Carrier <geoffroy.carrier@koon.fr> 
pkgname=jyraphe
pkgver=0.3
pkgrel=1
pkgdesc="A PHP web application of file repository"
arch=('i686' 'x86_64')
url="http://home.gna.org/jyraphe/"
license=('custom:"AGPL3+"')
depends=('php')
source=(http://download.gna.org/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('83055d847b25c7ace23de1c0e4958808')
build() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i "s|^\$cfg\['var_root'\].*|\$cfg\['var_root'\] = '/var/lib/$pkgname/';|" pub/lib/config.php
  rm -fr pub/var
  install -d -o nobody -g nobody "$pkgdir/var/lib/$pkgname/"{files,links,trash}
  install -D doc/COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
  install -d "$pkgdir/srv/www/$pkgname"
  cp -ra "$srcdir/$pkgname-$pkgver/"* "$pkgdir/srv/www/$pkgname"
}
