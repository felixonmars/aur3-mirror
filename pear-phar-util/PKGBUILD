# Maintainer: Romain Schmitz <slopjong _.at._ slopjong _.dot._ de>

pkgname=pear-phar-util
_pkgname=PharUtil
pkgver=0.6.1
pkgrel=1
pkgdesc="Security-oriented utilities for Phar archives."
arch=('i686' 'x86_64')
url="https://github.com/koto/phar-util"
license=('MIT')
depends=('php>=5.3' 'pear-console-commandline')
makedepends=('php-pear')
source=(http://pear.kotowicz.net/get/$_pkgname-$pkgver.tgz)
sha256sums=('425165711506ce0075e7a442098cf3c97786e3f2d676784df384845c7a77665b')
#install=phar-util.install

build() {
  # Fix the package description or the pear channel won't be found.
  # Since pear requires root privileges we can't register the channel
  # here because the package is built as non-root
  sed -ie 's/pear.kotowicz.net/pear.php.net/g' "$srcdir"/package.xml

  # repackage
  cd "$srcdir"
  tar czf "$_pkgname-$pkgver.tgz" "$_pkgname-$pkgver"/* package.xml
  #sha256sums=($(sha256sum "$_pkgname-$pkgver.tgz"))
  #echo $sha256sums
}
 
package() {
  pear install -R"$pkgdir" -O -n "$srcdir"/$_pkgname-$pkgver.tgz
  rm -r "$pkgdir"/usr/share/pear/{.channels,.depdb*,.filemap,.lock} "$pkgdir"/tmp
}