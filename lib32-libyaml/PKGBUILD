# Contributor: Johannes Dewender  arch at JonnyJD dot net
# Contributor: Sairon Istyar <saironiq@gmail.com>
pkgname=lib32-libyaml
pkgver=0.1.6
pkgrel=2
pkgdesc='32-bit yaml library (shared objects)'
arch=('x86_64')
url="http://pyyaml.org/wiki/LibYAML"
license=(MIT)

source=(http://pyyaml.org/download/libyaml/yaml-$pkgver.tar.gz)
md5sums=('5fe00cda18ca5daeb43762b80c38e06e')

build() {
  cd "$srcdir/yaml-$pkgver"

  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  ./configure --prefix=/usr --libdir=/usr/lib32
  make
}

package() {
  cd "$srcdir/yaml-$pkgver"
  make DESTDIR="$pkgdir" install
  install -m644 -D LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE

  rm -rf "$pkgdir"/usr/{include,share,bin}
}
