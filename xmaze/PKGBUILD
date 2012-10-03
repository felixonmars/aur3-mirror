# Maintainer: ewaller <ewwaller dot gmail dot com>
# Contributor: TDY <tdy@gmx.com>
# Contributor: Lex Black <autumn-wind at web dot de>

pkgname=xmaze
pkgver=1.3.6
pkgrel=2
pkgdesc="A random maze generator"
arch=('i686' 'x86_64')
url="http://www.phenix.bnl.gov/WWW/publish/hpereira/software/index.php?page=package&package_list=software_list_qt4&package=xmaze&full=1"
license=('GPL')
depends=('qt')
source=(http://www.phenix.bnl.gov/WWW/publish/hpereira/software/tgz/$pkgname-$pkgver.tar.gz)

md5sums=('8bdbc3fd8136bbcf3dd4411edfbaf96b')
build() {
  cd "$srcdir/$pkgname-$pkgver"
  cmake .
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install
}

