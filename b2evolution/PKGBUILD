# Maintainer: Dogukan Korkmazturk <d.korkmazturk@gmail.com>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Tilman Blumenbach <tilman (at) ax86 (dot) net>

pkgname=b2evolution
pkgver=3.3.3
pkgrel=1
pkgdesc="A medium scale Content Management System centered around the blog concept"
arch=('any')
url="http://b2evolution.net/"
license=('GPL')
depends=('php' 'mysql')
backup=(srv/http/$pkgname/blogs/conf/_basic_config.php
  srv/http/$pkgname/blogs/conf/_advanced.php)
source=(http://downloads.sourceforge.net/evocms/$pkgname-$pkgver-stable-2009-12-15.zip)
md5sums=('87bd0149e53ede8215decfd71eac0c1f')
sha1sums=('d494c31ed07c1074afb43927d69d70638daf521b')

build() {
  cd "$srcdir"/$pkgname
  install -m755 -d "$pkgdir"/srv/http/$pkgname
  cp blogs/conf/_basic_config{.template,}.php
  cp -r ./* "$pkgdir"/srv/http/$pkgname/
  find "$pkgdir"/srv/http/$pkgname -type d -exec chmod 755 {} +
  find "$pkgdir"/srv/http/$pkgname -type f -exec chmod 644 {} +
}
