# Maintainer: numkem <numkem@gmail.com>
pkgname=pear-log
_pkgname=Log
pkgver=1.12.7
pkgrel=1
pkgdesc="Logging Framework"
url=http://pear.php.net/package/$_pkgname
arch=('any')
license=('PHP')
makedepends=('php-pear')
source=(http://download.pear.php.net/package/$_pkgname-$pkgver.tgz)
noextract=($_pkgname-$pkgver.tgz)
md5sums=('8594a3d89eac997f072fa088b1eddc42')

package() {
  pear install -R"$pkgdir" -O -n "$srcdir"/$_pkgname-$pkgver.tgz

  rm -r "$pkgdir"/usr/share/pear/{.channels,.depdb*,.filemap,.lock} "$pkgdir"/tmp
}
