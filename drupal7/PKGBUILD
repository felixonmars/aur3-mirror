# Contributor: realitygaps <realitygaps AT yahoo DOT com>

pkgname=drupal7  
pkgrealname=drupal
pkgver=7.0
pkgrel=1
pkgdesc="A PHP-based content management platform"
arch=('any')
url="http://www.drupal.org/"
license=('GPL')
depends=('php')
install=('drupal.install')
backup=(srv/http/drupal7/.htaccess)
source=(http://www.drupal.org/files/projects/$pkgrealname-$pkgver.tar.gz)
md5sums=('e96c0a5e47c5d7706897384069dfb920')
build() {
  mkdir -p $startdir/pkg/srv/http/drupal7
  cp -r $startdir/src/$pkgrealname-$pkgver/{*,.htaccess} $startdir/pkg/srv/http/drupal7/
  echo "deny from all" > $startdir/pkg/srv/http/drupal7/.htaccess
}



