# Maintainer: Gerardo Exequiel Pozzi <vmlinuz386@yahoo.com.ar>

pkgname=flog
pkgver=1.8
pkgrel=2
pkgdesc="Reads from STDIN and writes to a file. If a SIGHUP is received, the file will be reopened (for logrotating)"
arch=('i686' 'x86_64')
url="http://oss.ezic.com/"
license=('GPL')
depends=('glibc')
source=(http://oss.ezic.com/flog/$pkgname-$pkgver.tar.gz)
md5sums=('adf022289e9b46817958140455e3e400')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  make || return 1

  install -d $pkgdir/usr/bin
  install -d $pkgdir/usr/share/doc/flog

  install -m 755 flog $pkgdir/usr/bin/
  install -m 644 README $pkgdir/usr/share/doc/flog/
}

# vim:set ts=2 sw=2 et:
