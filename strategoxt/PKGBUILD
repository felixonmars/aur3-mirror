# Contributor: Tocer Deng <tocer.deng@gmail.com>
pkgname=strategoxt
pkgver=0.17
pkgrel=1
pkgdesc="a framework for implementing software transformation systems"
arch=('i686') # not test in 'x86_64'
url="http://strategoxt.org/"
license=('LGPL')
depends=('libaterm=2.5' 'sdf2-bundle=2.4')
makedepends=()
source=(ftp://ftp.stratego-language.org/pub/stratego/StrategoXT/strategoxt-0.17/$pkgname-$pkgver.tar.gz)
md5sums=('6a1523ec105c5091a8174b276aceea1b')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr --with-aterm=/usr --with-sdf=/usr
  make || return 1
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
