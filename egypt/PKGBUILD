# Maintainer : David Costa <david@zarel.net>
# Contributor: Ivan Sichmann Freitas <ivansichfreitas@gmail.com>
# Contributor: Dan McGee <dpmcgee@gmail.com>

pkgname=egypt
pkgver=1.10
pkgrel=3
pkgdesc="A devilishly simple tool for creating call graphs of C programs"
url="http://www.gson.org/egypt/"
license=('GPL')
arch=('any')
depends=('perl' 'graphviz')
source=(http://www.gson.org/$pkgname/download/$pkgname-$pkgver.tar.gz)
md5sums=('591dce680bef60e73edccd0220957846')

build() {
  cd $srcdir/$pkgname-$pkgver
  perl Makefile.PL
  make

}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir INSTALL_BASE="/usr" install
  # remove a local-only file
  find $pkgdir -name perllocal.pod -exec rm {} \;
}
