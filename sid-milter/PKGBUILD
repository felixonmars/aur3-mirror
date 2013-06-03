# Contributor: Yejun Yang ( yejunx AT gmail DOT com )

pkgname='sid-milter'
pkgver=1.0.0
pkgrel=5
pkgdesc="The sid-milter package is an open source implementation of the Sender-ID and SPF sender authentication systems."
arch=('i686' 'x86_64')
url="http://sid-milter.sourceforge.net/"
license=('SENDMAIL')
depends=('libmilter' 'postfix>=2.5')
backup=('etc/conf.d/sid-filter.conf')
install=sid-milter.install
options=(!emptydirs)
source=("https://downloads.sourceforge.net/project/sid-milter/SenderID%20Milter/$pkgver/sid-milter-$pkgver.tar.gz"
	'sid-filter.conf'
	'sid-milter.service')
md5sums=('1fe0651bc27938ebd0d7c91d58d4ad5a'
         '396d6c1e101fff789c50368772fe4c95'
         '8ac32adb4b58094883ce961e27600200')

build() {
  cd $srcdir/$pkgname-$pkgver
  mkdir -p $pkgdir/usr/bin $pkgdir/usr/man/man8
  make
  make DESTDIR=$pkgdir install

  install -Dm644 $srcdir/sid-filter.conf $pkgdir/etc/conf.d/sid-filter.conf
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE

  mv $pkgdir/usr/man $pkgdir/usr/share/man
  install -Dm0644 $srcdir/sid-milter.service $pkgdir/usr/lib/systemd/system/sid-milter.service
}
