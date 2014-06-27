# Maintainer: Joris Steyn <jorissteyn@gmail.com>

pkgname=php-pcspeak-git
pkgver=9.32b5f6a
pkgrel=1
pkgdesc="A PC speaker API for PHP"
arch=('i686' 'x86_64')
url="https://github.com/jorissteyn/php_pcspeak"
license=('PHP')
install=php-pcspeak.install
depends=('php')
backup=('etc/php/conf.d/pcspeak.ini')
source=("git+https://github.com/jorissteyn/php_pcspeak.git"
        php-pcspeak.install)
md5sums=('SKIP'
         '46be6f57cfe99289712f3f586d4fa134')

pkgver() {
    cd "$srcdir"/php_pcspeak
    echo $(git rev-list --count master).$(git describe --tags --always)
}

build() {
  cd "$srcdir/php_pcspeak"

  phpize
  ./configure --prefix=/usr

  make && make INSTALL_ROOT="$pkgdir" install

  install -d "$pkgdir"/etc/php/conf.d
  echo ';extension=pcspeak.so' > "$pkgdir"/etc/php/conf.d/pcspeak.ini
}
