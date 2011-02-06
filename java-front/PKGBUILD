# Contributor: Tocer Deng <tocer.deng@gmail.com>
pkgname=java-front
pkgver=0.9
pkgrel=1
pkgdesc="a package that adds support for transforming Java programs to Stratego/XT"
arch=('i686') # not test in 'x86_64'
url="http://strategoxt.org/"
license=('LGPL')
depends=('strategoxt')
makedepends=()
source=(ftp://ftp.strategoxt.org/pub/stratego/StrategoXT/strategoxt-0.17/$pkgname-$pkgver.tar.gz)
md5sums=('a69c5c58c19c4205bb78e0f71a216f2c')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr --with-aterm=/usr --with-sdf=/usr --with-strategoxt=/usr
  make || return 1
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
