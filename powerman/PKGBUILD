# Maintainer: TDY <tdy@archlinux.info>

pkgname=powerman
pkgver=2.3.16
pkgrel=1
pkgdesc="A tool for manipulating remote power control (RPC) devices from a central location"
arch=('i686' 'x86_64')
url="http://code.google.com/p/powerman/"
license=('GPL')
options=('!libtool' '!emptydirs')
install=$pkgname.install
source=(http://$pkgname.googlecode.com/files/$pkgname-$pkgver.tar.gz
        $pkgname.rc
        $pkgname.service)
md5sums=('23b08becbd6f2861bc77187bf6be4e68'
         '9db9cbd0217eab9544c12b7ab3ad3a7b'
         '4e3ab6c303b2bbf1d8fe0dc1da674022')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i 's/init\.d/rc.d/' Makefile.in
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

check() {
  cd "$srcdir/$pkgname-$pkgver"
  #make -k check
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
  install -Dm755 ../$pkgname.rc "$pkgdir/etc/rc.d/$pkgname"
  install -Dm644 ../$pkgname.service "$pkgdir/usr/lib/systemd/system/$pkgname.service"
}

# vim:set ts=2 sw=2 et:
