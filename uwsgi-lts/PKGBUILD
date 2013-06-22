# Maintainer: Si Feng <si.feng at me.com>

pkgname=uwsgi-lts
_pkgname=uwsgi
pkgver=1.4.9
pkgrel=1
pkgdesc="A fast, self-healing and developer/sysadmin-friendly application container server coded in pure C"
arch=(i686 x86_64)
url="http://projects.unbit.it/$_pkgname/"
license=(GPL2)
depends=(python2 libxml2)
conflicts=(uwsgi)
makedepends=(gcc python2)
source=(http://projects.unbit.it/downloads/$_pkgname-$pkgver.tar.gz)
md5sums=('3fe995a39e0489621ddcc7acfbd49171')

build() {
  cd $srcdir/$_pkgname-$pkgver
  python2 uwsgiconfig.py --build
}

package() {
  cd $srcdir/$_pkgname-$pkgver
  install -d $pkgdir/usr/bin
  install -Dm755 uwsgi $pkgdir/usr/bin/uwsgi
}
