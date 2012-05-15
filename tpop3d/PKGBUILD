pkgname=tpop3d
pkgver=1.5.3
pkgrel=4
pkgdesc="A high-performance pop3 server with virtualhost and maildir support and several auth method"
arch=('i686' 'x86_64')
url="http://www.ex-parrot.com/~chris/tpop3d/"
license=('unknown')
depends=('pam' 'openssl' 'glibc')
backup=('etc/tpop3d.conf' 'etc/conf.d/tpop3d')
source=(http://www.ex-parrot.com/~chris/tpop3d/$pkgname-$pkgver.tar.gz
        tpop3d
        tpop3d.conf.d)
md5sums=('dd920c49f4e5879eb3caf7ea047622e9'
         '002236fdfa9ee65949e51990e03a8767'
         '295d22c251d9e2cd6e7dd2dd9ae9df2e')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install
  install -D -m755 "$srcdir/tpop3d" "$pkgdir/etc/rc.d/tpop3d"
  install -D -m644 "$srcdir/tpop3d.conf.d" "$pkgdir/etc/conf.d/tpop3d"
  install -D -m644 tpop3d.conf.sample "$pkgdir/etc/tpop3d.conf"
}
