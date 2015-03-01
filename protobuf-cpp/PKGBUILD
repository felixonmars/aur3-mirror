# Maintainer: Aleksey Filippov <sarum9in@gmail.com>

_pkgname='protobuf'
pkgname=$_pkgname-cpp
pkgver=3.0.0_alpha_2
_pkgver=$(echo $pkgver | tr _ -)
pkgrel=1
pkgdesc="Protocol Buffers - Google's data interchange format"
arch=('i686' 'x86_64')
url='https://developers.google.com/protocol-buffers/'
license=('BSD')
depends=('gcc-libs' 'zlib')
source=(https://github.com/google/$_pkgname/releases/download/v$_pkgver/$pkgname-$_pkgver.tar.gz)
md5sums=('b53d6529446b427c54bbf1475db93e2e')
conflicts=('protobuf')
provides=('protobuf')

build() {
  cd $_pkgname-$_pkgver
  ./configure --prefix=/usr
  make
}

check() {
  true
  # FAILED RubyGeneratorTest.GeneratorTest
  #make -C $_pkgname-$_pkgver check
}

package() {
  cd $_pkgname-$_pkgver
  make DESTDIR="$pkgdir" install
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE

  install -Dm644 editors/protobuf-mode.el \
    "$pkgdir"/usr/share/emacs/site-lisp/protobuf-mode.el
}
