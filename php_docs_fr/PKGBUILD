# Contributor: Paco <ribemont.francois@gmail.com>

pkgname=php_docs_fr
pkgver=5.2.9_2
pkgrel=1
pkgdesc="Set of HTML documentation for PHP."
arch=('i686' 'x86_64')
url="http://www.php.net/docs.php"
license=('PHP')
depends=('php')
options=('docs')
source=(http://www.php.net/distributions/manual/php_manual_fr.tar.gz)
md5sums=('9e4892a83e26ba533a583c754fd4f12d')

build(){
  cd $startdir
  install -d $pkgdir/usr/share/doc/php/
  cp -rf src/html $pkgdir/usr/share/doc/php/ || return 1
}
