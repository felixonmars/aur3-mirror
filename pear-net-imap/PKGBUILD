# Maintainer: numkem <numkem@gmail.com>

pkgname=pear-net-imap
_pkgname=Net_IMAP
pkgver=1.1.2
pkgrel=1
pkgdesc="Provides an implementation of the IMAP protocol"
url=http://pear.php.net/package/$_pkgname
arch=('any')
license=('PHP')
depends=('pear-net-socket')
makedepends=('php-pear')
optdepends=('pear-auth-sasl2')
source=(http://download.pear.php.net/package/$_pkgname-$pkgver.tgz)
noextract=($_pkgname-$pkgver.tgz)
md5sums=('6806c2c09d0ecf724caade9cfebba4b0')

package() {
  pear install -R"$pkgdir" -O -n "$srcdir"/$_pkgname-$pkgver.tgz

  rm -r "$pkgdir"/usr/share/pear/{.channels,.depdb*,.filemap,.lock} "$pkgdir"/tmp
}
