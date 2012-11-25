# Maintainer: Sergio Correia <sergio.correia@uece.net>

pkgname=google-js-test
_pkgname=gjstest
pkgver=1.0.8
pkgrel=1
pkgdesc="Lightweight JS unit testing using the V8 engine"
arch=('i686' 'x86_64')
url="http://code.google.com/p/google-js-test/"
license=('Apache')
depends=('google-glog' 'protobuf' 'google-gflags' 're2-hg' 'libxml2' 'v8')
makedepends=('protobuf-c')
source=(http://google-js-test.googlecode.com/files/$_pkgname-$pkgver.tar.bz2
        'pthread-once-glibc-fix.patch'
        'fix-prefix.patch')
md5sums=('30d67f307a1c3bfe55b76e7d18331324'
         '648053507025b1d2017422050dc04929'
         '16df37caaa16d9c3c49a7d91d4491a5b')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  patch -uNp1 -i ../pthread-once-glibc-fix.patch || return 1
  patch -uNp1 -i ../fix-prefix.patch || return 1

  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  make PREFIX=$pkgdir"/usr/" install
}

# vim:set ts=2 sw=2 et:
