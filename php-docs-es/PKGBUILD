# $Id$
# Contributor: Jesus Jerez (jerezmoreno at gmail dot com)

pkgname=php-docs-es
pkgver=5.3.5
pkgrel=1
pkgdesc="Set of HTML spanish documentation for PHP."
arch=('any')
url="http://www.php.net/docs.php"
license=('PHP')
depends=('php')
options=('docs' '!strip')
source=(php_manual_es-$pkgver.tar.gz::http://www.php.net/distributions/manual/php_manual_es.tar.gz)
md5sums=('38af55bac7bee14b80a4cab3dfe8bab2')

build(){
  cd $srcdir
  install -d $pkgdir/usr/share/doc/php/
  cp -rf php-chunked-xhtml $pkgdir/usr/share/doc/php/es
}

