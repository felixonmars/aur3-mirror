# Maintainer: Romain Schmitz <slopjong _.at._ slopjong _.dot._ de>

pkgname=pear-console-commandline
_pkgname=Console_CommandLine
pkgver=1.2.0
pkgrel=1
pkgdesc="A full featured command line options and arguments parser"
url=http://pear.php.net/package/$_pkgname
arch=('any')
license=('MIT')
makedepends=('php-pear')
#optdepends=('pear-auth-sasl2')
source=(http://download.pear.php.net/package/$_pkgname-$pkgver.tgz)
noextract=($_pkgname-$pkgver.tgz)
sha256sums=('18f2cbed4ab2af1c5423e5f24bc1689f4d789b1bb36dde2e0c4d198d7c71c17e')

package() {
  pear install -R"$pkgdir" -O -n "$srcdir"/$_pkgname-$pkgver.tgz
  rm -r "$pkgdir"/usr/share/pear/{.channels,.depdb*,.filemap,.lock} "$pkgdir"/tmp
}
