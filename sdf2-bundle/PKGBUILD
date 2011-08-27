# Contributor: Tocer Deng <tocer.deng@gmail.com>

pkgname=sdf2-bundle
pkgver=2.4
pkgrel=1
pkgdesc="SDF2 syntax definition formalism"
arch=('i686')
url="http://strategoxt.org/"
license=('GPL')
depends=()
makedepends=()
source=(ftp://ftp.stratego-language.org/pub/stratego/StrategoXT/strategoxt-0.17/$pkgname-$pkgver.tar.gz)
md5sums=('8aa110d790c4a8bf7bc8b884590d7bee')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr --with-aterm=/usr
  make || return 1
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
