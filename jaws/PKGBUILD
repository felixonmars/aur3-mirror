# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Mark Rosenstand <mark@borkware.net>

pkgname=jaws
pkgver=0.8.9
pkgrel=1
pkgdesc="A Framework and Content Management System for building dynamic web sites"
arch=('any')
url="http://www.jaws-project.com/"
license=('GPL' 'LGPL' 'BSD')
depends=('php')
optdepends=('mysql: for MySQL support' \
  'php-pgsql: for PostgreSQL support'\
  'php-sqlite: for SQLite support' \
  'gd: for Photo Organizer support' \
  'imagemagick: for Photo Organizer support')
backup=(srv/http/$pkgname/.htaccess)
source=(http://bits.jaws-project.com/releases/$pkgname-$pkgver/$pkgname-complete-$pkgver.tar.gz)
md5sums=('87ec8f678e483a794dd268ca6aa0a592')

build() {
  cd "$srcdir"
  install -m755 -d "$pkgdir"/srv/http/$pkgname
  mv html/{,.}htaccess
  mv html/data/{,.}htaccess
  cp -r html/{*,.htaccess} "$pkgdir"/srv/http/$pkgname/
  find "$pkgdir"/srv/http/$pkgname -type d -exec chmod 755 {} +
  find "$pkgdir"/srv/http/$pkgname -type f -exec chmod 644 {} +
  install -Dm644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/COPYING
  install -Dm644 NEW_BSD "$pkgdir"/usr/share/licenses/$pkgname/BSD_LICENSE
}
