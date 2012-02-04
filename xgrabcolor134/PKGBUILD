# Maintainer: TDY <tdy@gmx.com>

_pkgname=xgrabcolor
pkgver=1.3.4
pkgrel=1
pkgdesc="A basic color picker"
arch=('i686' 'x86_64')
url="http://www.phenix.bnl.gov/WWW/publish/hpereira/software/index.php?page=package&package_list=software_list_qt4&package=xgrabcolor&full=1"
license=('GPL')
depends=('qt')
source=(http://www.phenix.bnl.gov/WWW/publish/hpereira/software/tgz/$_pkgname-$pkgver.tar.gz
        liborder.patch)
md5sums=('9d66e617309773cfccf8e0b187e2cdb5'
         '57769a99e168b6055511c232aed2f04d')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  patch  -Np1 -i ../liborder.patch
  ./autogen.sh --prefix=/usr --with-qt-dir=/usr
  make || return 1
  make DESTDIR="$pkgdir" install
}
pkgname=xgrabcolor134
provides=(xgrabcolor)
conflicts=(xgrabcolor)

