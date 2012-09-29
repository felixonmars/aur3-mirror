# Maintainer: Chih-Mao Chen <pkmx.tw@gmail.com>

pkgname=teajs
pkgver=0.9.4
pkgrel=2
pkgdesc="Your cup of server-side Javascript. Formerly known as v8cgi."
arch=('x86_64')
url="http://code.google.com/p/teajs/"
license=('BSD')
depends=('v8' 'sqlite' 'gd' 'libmysqlclient')
optdepends=('apache: mod_teajs support')
makedepends=('scons')
backup=('etc/teajs.conf')
install=.install
source=(http://teajs.googlecode.com/files/teajs-0.9.4-src.tar.gz)
md5sums=('5030c828a82d569878ef64ffcbe1ef41')

build() {
  cd "$srcdir/$pkgname-$pkgver-src/teajs"
  echo "env.Append(CPPFLAGS='-include unistd.h')" >> SConstruct
  scons memcached=0 v8_path=/usr apache_path=/usr/include/httpd apr_path=/usr/include/apr-1
}

check() {
  cd "$srcdir/$pkgname-$pkgver-src/teajs"
  ./tea unit/runner.js unit/tests/*.js
}

package() {
  cd "$srcdir/$pkgname-$pkgver-src/teajs"
  mkdir -p "$pkgdir/usr/lib/"
  cp -a lib "$pkgdir/usr/lib/teajs"
  install -Dm755 tea "$pkgdir/usr/bin/teajs"
  install -Dm755 mod_teajs.so "$pkgdir/usr/lib/httpd/modules/mod_teajs.so"
  install -Dm644 apache2/mods-available/teajs.conf "$pkgdir/etc/httpd/conf/extra/teajs_module.conf"
  install -Dm644 teajs.conf.posix "$pkgdir/etc/teajs.conf"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
