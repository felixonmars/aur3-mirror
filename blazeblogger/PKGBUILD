# Maintainer: Abakus <java5 at arcor dot de>
pkgname=blazeblogger
pkgver=1.2.0
pkgrel=1
pkgdesc="is a simple-to-use but capable CMS for the command line"
arch=('i686' 'x86_64')
url="http://blaze.blackened.cz"
license=('GPL')
depends=('perl')
optdepends=('markdown: To write your entries')
source=("http://blazeblogger.googlecode.com/files/${pkgname}-${pkgver}.tar.gz")
md5sums=('a126ea460e389f73d0f0fb45164bdaf9')

build() {
  cd $srcdir/$pkgname-$pkgver
  sed -i 's|/usr/bin/pod2man|pod2man|' Makefile || return 1
  sed -i 's|/usr/bin/install|/bin/install|' Makefile || return 1
  make prefix=$pkgdir/usr config=$pkgdir/etc install
}
