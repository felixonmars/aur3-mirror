# Contributor: Abdallah Aly < l3thal8 @gmail.com >
pkgname=falcon-apache2
pkgver=1.6.0
pkgrel=1
pkgdesc="the apache2 falcon mod for running falcon web pages"
license=('custom:"GPLv2 or Falcon Programming Language License"')
url="http://www.falconpl.org"
source=(http://www.falconpl.org/project_dl/$pkgname/$pkgname-$pkgver.tgz)
md5sums=('7b19e67ab021705a507af41b99c137f4')
arch=(i686 x86_64)
makedepends=('cmake')
depends=('falcon' 'apache')
provide=('falcon-apache2')

build() {
  cd $startdir/src/$pkgname-$pkgver
  cmake -DAPACHE_REAL_INCLUDE_DIR=/usr/include/httpd/ . || return 1
  make || return 1
  mkdir -p $pkgdir/usr/lib/httpd/modules/
  cp $srcdir/$pkgname-$pkgver/mod_falcon.so $pkgdir/usr/lib/httpd/modules/
  mkdir -p $startdir/pkg/usr/share/licenses/falcon || return 1
  cp LICENSE $startdir/pkg/usr/share/licenses/falcon/falcon-apache2 || return 1

}

