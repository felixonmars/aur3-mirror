# Maintainer: Mert Dikmen <mertdikmen@gmail.com>
# Contributor: Mert Dikmen <mertdikmen@gmail.com>

pkgname=pecl-sphinx
pkgver=1.3.2
pkgrel=1
pkgdesc="Binary alternative PHP API for Sphinx SQL full-text search engine"
arch=(i686 x86_64)
url="http://pecl.php.net/package/sphinx/"
license=('GPL')
depends=('php' 'sphinx-svn')

source="http://pecl.php.net/get/sphinx-${pkgver}.tgz"
md5sums=('da44407c2ca6584fa5fa673bd0ac9708')

package(){
  cd $startdir/src/sphinx-$pkgver
  phpize
  ./configure --prefix=/usr --with-sphinx
  make || return 1
  make INSTALL_ROOT=${pkgdir} install
}
