# Contributor: Jonathan Liu <net147@gmail.com>
pkgname=hotwayd
pkgver=0.8.4
pkgrel=2
pkgdesc="POP3 to Hotmail (HTTPmail) gateway"
arch=(i686 x86_64)
url="http://sourceforge.net/projects/hotwayd/"
license=('GPL')
depends=('libsasl' 'libxml2')
backup=(etc/hotwayd/access_list
        etc/xinet.d/hotsmtpd
        etc/xinet.d/hotwayd)
source=(http://downloads.sourceforge.net/sourceforge/$pkgname/$pkgname-$pkgver.tar.gz
        hotsmtpd.xinetd
        hotwayd.xinetd)
md5sums=('f8ed1bb2c069df264acbc8e857a1d003'
         '9b4fb5038fc58d06c5a38d9beff56544'
         '5241ce92d6f9dc8a5a81f62581c33e3d')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir/" install

  install -d "$pkgdir/etc/hotwayd"
  touch "$pkgdir/etc/hotwayd/access_list"
  chmod 644 "$pkgdir/etc/hotwayd/access_list"
  install -D -m644 "$srcdir/hotsmtpd.xinetd" "$pkgdir/etc/xinetd.d/hotsmtpd"
  install -D -m644 "$srcdir/hotwayd.xinetd" "$pkgdir/etc/xinetd.d/hotwayd"
}

# vim:set ts=2 sw=2 et:
