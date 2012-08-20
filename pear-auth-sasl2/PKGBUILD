# Maintainer: jsteel <mail at jsteel dot org>

pkgname=pear-auth-sasl2
_pkgname=Auth_SASL2
pkgver=0.1.0
pkgrel=1
pkgdesc="Provides code to generate responses to common SASL mechanisms"
url=http://pear.php.net/package/$_pkgname
arch=('any')
license=('PHP')
makedepends=('php-pear')
source=(http://download.pear.php.net/package/$_pkgname-$pkgver.tgz)
noextract=($_pkgname-$pkgver.tgz)
md5sums=('aa105eb20b3ac0fd99b63a2639b0e111')

package() {
  pear install -R"$pkgdir" -O -n "$srcdir"/$_pkgname-$pkgver.tgz

  rm -r "$pkgdir"/usr/share/pear/{.channels,.depdb*,.filemap,.lock} "$pkgdir"/tmp
}
