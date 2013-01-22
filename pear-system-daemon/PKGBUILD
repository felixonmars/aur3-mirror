# Maintainer: numkem <numkem@gmail.com>
pkgname=pear-system-daemon
_pkgname=System_Daemon
pkgver=1.0.0
pkgrel=1
pkgdesc="Turn PHP scripts into Linux daemons"
url=http://pear.php.net/package/$_pkgname
arch=('any')
license=('PHP')
makedepends=('php-pear')
optdepends=('pear-log: enhanced logging')
source=(http://download.pear.php.net/package/$_pkgname-$pkgver.tgz)
noextract=($_pkgname-$pkgver.tgz)
md5sums=('95b8a56bf6e92ad9daa2d3703bd2ba67')

package() {
  pear install -R"$pkgdir" -O -n "$srcdir"/$_pkgname-$pkgver.tgz

  rm -r "$pkgdir"/usr/share/pear/{.channels,.depdb*,.filemap,.lock} "$pkgdir"/tmp
}
