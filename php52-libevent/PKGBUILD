# Contributor: LD King <kldscs@gmail.com>

pkgname=php52-libevent
pkgver=0.0.4
pkgrel=1
pkgdesc="Libevent is a library that provides a mechanism to execute a callback function when a specific event occurs on a file descriptor or after a timeout has been reached."
arch=('i686' 'x86_64')
url="http://pecl.php.net/package/libevent"
license=('PHP')
depends=('php52' 'libevent')
backup=('etc/php/conf.d/libevent.ini')
install=php52-libevent.install
source=(http://pecl.php.net/get/libevent-$pkgver.tgz)
md5sums=('ab19ae2a0ddbbf2465addae64ccee56d')

build() {
  cd "$srcdir/libevent-$pkgver"

  phpize || return 1
  ./configure --prefix=/usr
  make || return 1
  make INSTALL_ROOT="$pkgdir" install
  echo ';extension=libevent.so' > libevent.ini
  install -D -m644 libevent.ini "$pkgdir/etc/php/conf.d/libevent.ini"
}

# vim:set ts=2 sw=2 et:
