pkgname=php-phalcon-framework
pkgver=2.0.1
pkgrel=1
pkgdesc="Web framework implemented as a C extension offering high performance and lower resource consumption"
url="http://phalconphp.com"
arch=('x86_64' 'i686' 'armv7h')
[[ $CARCH == 'i686' ]] && cd _arch=32bits || _arch=64bits
license=('PHP')
depends=('php')
conflicts=('php-phalcon' 'phalcon-git')
provides=('php-phalcon')
backup=('etc/php/conf.d/phalcon.ini')

source=(
        "https://github.com/phalcon/cphalcon/archive/phalcon-v$pkgver.zip"
)

sha256sums=('22338240d72eed577f97983d28d78e299a2185a1e43d128a81bf8dba0777d8d7')

build() {
  cd "$srcdir/cphalcon-phalcon-v$pkgver/build/$_arch"
  export CFLAGS="-O2 -fno-delete-null-pointer-checks"
  phpize
  ./configure --prefix=/usr --enable-phalcon
  make
}

package() {
  cd "$srcdir/cphalcon-phalcon-v$pkgver/build/$_arch"
  make INSTALL_ROOT="$pkgdir" install
  echo 'extension=phalcon.so' > phalcon.ini
  install -Dm644 phalcon.ini "$pkgdir/etc/php/conf.d/phalcon.ini"
}
