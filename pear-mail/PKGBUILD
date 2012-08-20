# Maintainer: jsteel <mail at jsteel dot org>

pkgname=pear-mail
_pkgname=Mail
pkgver=1.2.0
pkgrel=1
pkgdesc="Defines an interface for implementing mailers under the PEAR hierarchy"
url=http://pear.php.net/package/$_pkgname
arch=('any')
license=('PHP')
depends=('pear-net-smtp' 'php-pear')
source=(http://download.pear.php.net/package/$_pkgname-$pkgver.tgz)
noextract=($_pkgname-$pkgver.tgz)
md5sums=('1bb2c88905f255490c4706b5394c2036')

package() {
  pear install -R"$pkgdir" -O -n "$srcdir"/$_pkgname-$pkgver.tgz

  rm -r "$pkgdir"/usr/share/pear/{.channels,.depdb*,.filemap,.lock} "$pkgdir"/tmp
}
