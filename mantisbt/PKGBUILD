# Maintainer: Alexander 'gridcol' Griesbaum <agrsbm at gmail dot com>
# Contributor: Ravenman <correo.cuervo@gmail.com>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Angel 'angvp' Velasquez <angvp.archlinux.com.ve>

pkgname=mantisbt
pkgver=1.2.17
pkgrel=1
pkgdesc="A free web-based bugtracking system written in PHP"
arch=('any')
url="http://www.mantisbt.org/"
license=('GPL')
depends=('php>=5.1')
optdepends=('mariadb: SQL database server'
'php-pgsql: support PostgreSQL'
'curl: required for Twitter integration feature'
'gd: required for graphs feature')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('b3080a3a9351524c547823d33a76106f')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -m755 -d "$pkgdir/srv/http/$pkgname"
  cp -r ./* "$pkgdir/srv/http/$pkgname/"
  find "$pkgdir/srv/http/$pkgname" -type d -exec chmod 755 {} +
  find "$pkgdir/srv/http/$pkgname" -type f -exec chmod 644 {} +
}
